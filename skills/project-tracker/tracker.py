#!/usr/bin/env python3
"""
Project Tracker — parses project updates and writes to meta.md
Usage:
  tracker.py update "25-67725 rev 2 is quoting due 4/7/26"
  tracker.py status 25-67725
  tracker.py list
"""

import os
import re
import sys
import json
import subprocess
from datetime import datetime
from pathlib import Path

WORKSPACE = "/home/nathan/.openclaw/workspace"
PROJECTS_DIR = os.path.join(WORKSPACE, "projects")
ONTOLOGY_SCRIPT = os.path.join(WORKSPACE, "skills/ontology/scripts/ontology.py")
LOG_FILE = os.path.join(WORKSPACE, "memory", "ontology", "project-tracker.log")

STATUS_MAP = {
    'quoting': 'quoting', 'quote': 'quoting', 'q': 'quoting', 'rev': 'quoting',
    'sent': 'sent', 'send': 'sent',
    'awarded': 'awarded', 'won': 'awarded', 'awarded': 'awarded',
    'lost': 'lost',
    'mothballed': 'mothballed', 'mothball': 'mothballed', 'parked': 'mothballed',
    'new': 'new',
    'active': 'active',
    'completed': 'completed', 'done': 'completed', 'finish': 'completed',
    'paused': 'paused', 'hold': 'paused', 'on hold': 'paused',
}

def log(msg):
    ts = datetime.now().strftime("%Y-%m-%d %H:%M")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{ts}] {msg}\n")

def parse_update(text):
    """Parse natural language project update into structured data."""
    text = text.strip()
    result = {
        'project_id': None,
        'status': None,
        'rev': None,
        'due': None,
        'customer': None,
        'note': None,
    }

    # Extract project ID (e.g., 25-67725, 24-68775)
    proj_match = re.search(r'\b(\d{2}-\d{5})\b', text)
    if proj_match:
        result['project_id'] = proj_match.group(1)

    # Extract revision (e.g., rev 2, Rev 1, revision 3)
    rev_match = re.search(r'\brev(?:ision)?\s*(\d+)\b', text, re.IGNORECASE)
    if rev_match:
        result['rev'] = f"Rev {rev_match.group(1)}"

    # Extract status
    lower_text = text.lower()
    for kw, status in STATUS_MAP.items():
        if kw in lower_text:
            result['status'] = status
            break

    # Extract due date
    # Formats: due 4/7/26, due 4/7, due April 7 2026, due ASAP
    due_match = re.search(r'\bdue\s+(ASAP|[\d/\-]+(?:th|rd|nd|st)?(?:[\s,]+(?:jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*[\s,]*\d{2,4})?)\b', text, re.IGNORECASE)
    if due_match:
        due_val = due_match.group(1).strip()
        if due_val.upper() != 'ASAP':
            # Normalize to YYYY-MM-DD
            result['due'] = normalize_date(due_val)
        else:
            result['due'] = 'ASAP'

    # Extract customer (e.g., Ford, MBUSI, Mercedes)
    customer_match = re.search(r'\b(Ford|Mercedes|MBUSI|Stellantis|Metalsa|GM|BMW|Toyota)\b', text, re.IGNORECASE)
    if customer_match:
        c = customer_match.group(1)
        result['customer'] = c.title() if c.lower() != 'mbusi' else 'MBUSI'

    # Extract notes (everything after "note:", "notes:", "//", "--")
    note_match = re.search(r'(?:note[s]?:|//|--)\s*(.+?)(?:\s+(?:rev|status|due|customer)\b|$)', text, re.IGNORECASE)
    if note_match:
        result['note'] = note_match.group(1).strip().rstrip('.')
    else:
        # Try to extract trailing context that looks like notes (timing limitation, waiting for, etc.)
        trailing = re.search(r'(?:timing|schedule|waiting|blocked|pending|awaiting)\s*(?:for\s+)?(.+?)$', text, re.IGNORECASE)
        if trailing:
            result['note'] = trailing.group(1).strip().rstrip('.')
        elif re.search(r'\b(timing|limitation|schedule|waiting|blocked|pending)\b', text, re.IGNORECASE):
            # Extract the key phrase
            phrase = re.search(r'(timing\s*limitation|cannot\s+quote|schedule\s+limitation|waiting\s+for)', text, re.IGNORECASE)
            if phrase:
                result['note'] = phrase.group(1).strip()

    return result

def normalize_date(date_str):
    """Convert various date formats to YYYY-MM-DD."""
    date_str = date_str.strip()

    # Already YYYY-MM-DD
    if re.match(r'^\d{4}-\d{2}-\d{2}$', date_str):
        return date_str

    # MM/DD/YY or M/D/YY
    m = re.match(r'^(\d{1,2})/(\d{1,2})/(\d{2,4})$', date_str)
    if m:
        month, day, year = m.groups()
        if len(year) == 2:
            year = '20' + year if int(year) < 50 else '19' + year
        return f"{year}-{int(month):02d}-{int(day):02d}"

    # Month name formats
    month_map = {'jan':'01','feb':'02','mar':'03','apr':'04','may':'05','jun':'06',
                 'jul':'07','aug':'08','sep':'09','oct':'10','nov':'11','dec':'12'}
    m = re.match(r'^(\w+)\s+(\d{1,2})(?:[\s,]+(\d{4}))?$', date_str, re.IGNORECASE)
    if m:
        mon_str, day, year = m.groups()
        mon = month_map.get(mon_str[:3].lower(), '01')
        year = year or datetime.now().year
        return f"{year}-{mon}-{int(day):02d}"

    return date_str

def read_meta(proj_id):
    """Read existing meta.md for a project."""
    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")
    if not os.path.exists(meta_path):
        return None
    with open(meta_path, 'r') as f:
        return f.read()

def write_meta(proj_id, content):
    """Write meta.md for a project."""
    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")
    os.makedirs(os.path.dirname(meta_path), exist_ok=True)
    with open(meta_path, 'w') as f:
        f.write(content)
    return True

def build_meta(proj_id, data, existing_content=None):
    """Build meta.md content from parsed data."""
    today = datetime.now().strftime("%Y-%m-%d")

    # Parse existing content if provided
    existing = {}
    if existing_content:
        # Extract existing values
        for line in existing_content.split('\n'):
            m = re.match(r'^#\s+(\S+)', line)
            if m:
                existing['_title'] = line
                # Try to extract customer from title format: "# 25-72313 — Ford — Description"
                title_match = re.match(r'^#\s+\S+\s+—\s+(.+?)\s+—', line)
                if title_match:
                    existing['_title_customer'] = title_match.group(1).strip()
            m = re.match(r'^\*\*Status:\*\*\s*(.+)', line, re.IGNORECASE)
            if m:
                existing['status'] = m.group(1).strip()
            m = re.match(r'^\*\*Revision:\*\*\s*(.+)', line, re.IGNORECASE)
            if m:
                existing['rev'] = m.group(1).strip()
            m = re.match(r'^\*\*Due date:\*\*\s*(.+)', line, re.IGNORECASE)
            if m:
                existing['due'] = m.group(1).strip()
            m = re.match(r'^\*\*Customer:\*\*\s*(.+)', line, re.IGNORECASE)
            if m:
                existing['customer'] = m.group(1).strip()
            m = re.match(r'^\*\*Sent date:\*\*\s*(.+)', line, re.IGNORECASE)
            if m:
                existing['sent_date'] = m.group(1).strip()

        # Extract history
        hist_match = re.search(r'## History\s*\n+(.*?)(?=\n##|\Z)', existing_content, re.DOTALL)
        if hist_match:
            existing['history'] = hist_match.group(1).strip()

    # Get title from existing or build default
    title = existing.get('_title', f"# {proj_id}")

    # Merge: use new data, fall back to existing
    status = data.get('status') or existing.get('status', 'new')
    rev = data.get('rev') or existing.get('rev', 'Rev 0')
    due = data.get('due') or existing.get('due', '')
    customer = data.get('customer') or existing.get('customer') or existing.get('_title_customer', '')
    note = data.get('note')
    history = existing.get('history', '')

    # Build history entry
    history_entries = []
    if history:
        history_entries.append(history)

    changes = []
    if data.get('status') and data['status'] != existing.get('status', '').lower():
        changes.append(f"{status.title()}")
    if data.get('rev') and data['rev'] != existing.get('rev', ''):
        changes.append(data['rev'])
    if data.get('due') and data['due'] != existing.get('due', ''):
        changes.append(f"due {data['due']}")
    if note:
        changes.append(note)

    if changes:
        hist_line = f"- {today} — {' '.join(changes)}"
        history_entries.append(hist_line)

    # Build notes section
    notes_content = ""
    if note:
        notes_content = f"{note}\n"
    elif existing_content:
        notes_match = re.search(r'## Notes\s*\n+(.*?)(?=\n##|\Z)', existing_content, re.DOTALL)
        if notes_match and notes_match.group(1).strip():
            notes_content = notes_match.group(1).strip() + "\n"

    history_block = "\n".join(history_entries)

    return f"""{title}

## Status
- **Status:** {status.title() if status else 'New'}
- **Revision:** {rev}
- **Due date:** {due}
- **Customer:** {customer}

## Notes
{notes_content}## History
{history_block}
"""

def sync_to_ontology(proj_id, props):
    """Sync a single project update to ontology."""
    entity_id = 'proj_' + proj_id.replace('-', '_')
    props_json = json.dumps(props).replace("'", "'\\''")
    cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} update --id {entity_id} --props '{props_json}'"
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        return result.returncode == 0, result.stdout.strip() or result.stderr.strip()
    except Exception as e:
        return False, str(e)

def cmd_update(text):
    """Handle a project update."""
    if not text:
        print("ERROR: No update text provided")
        sys.exit(1)

    data = parse_update(text)

    if not data['project_id']:
        print("ERROR: Could not find project ID (format: XX-XXXXX)")
        sys.exit(1)

    proj_id = data['project_id']
    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")

    # Read existing meta.md
    existing_content = None
    if os.path.exists(meta_path):
        with open(meta_path, 'r') as f:
            existing_content = f.read()

    # Build new meta content
    new_content = build_meta(proj_id, data, existing_content)

    # Write
    try:
        os.makedirs(os.path.dirname(meta_path), exist_ok=True)
        with open(meta_path, 'w') as f:
            f.write(new_content)
    except Exception as e:
        print(f"ERROR: Failed to write meta.md: {e}")
        sys.exit(1)

    log(f"UPDATE {proj_id}: status={data['status']} rev={data['rev']} due={data['due']}")

    # Sync to ontology (fire and forget)
    ont_props = {}
    if data['status']:
        ont_props['status'] = data['status']
    if data['rev']:
        ont_props['rev'] = data['rev']
    if data['due']:
        ont_props['due'] = data['due']
    if data['customer']:
        ont_props['customer'] = data['customer']

    if ont_props:
        ok, msg = sync_to_ontology(proj_id, ont_props)
        log(f"  ONTOLOGY sync: {'ok' if ok else 'FAIL'} — {msg}")

    # Build confirmation message
    parts = []
    if data['status']:
        parts.append(data['status'])
    if data['rev']:
        parts.append(data['rev'])
    if data['due']:
        parts.append(f"due {data['due']}")
    if data['note']:
        parts.append(f"({data['note']})")

    confirmation = f"Updated {proj_id}: {', '.join(p for p in parts if p)}"
    print(confirmation)

def cmd_status(proj_id):
    """Show status of a single project."""
    if not proj_id:
        print("ERROR: Project ID required")
        sys.exit(1)

    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")
    if not os.path.exists(meta_path):
        print(f"ERROR: No meta.md found for {proj_id}")
        sys.exit(1)

    with open(meta_path, 'r') as f:
        content = f.read()

    # Parse and display
    status = re.search(r'\*\*Status:\*\*\s*(.+)', content, re.IGNORECASE)
    rev = re.search(r'\*\*Revision:\*\*\s*(.+)', content, re.IGNORECASE)
    due = re.search(r'\*\*Due date:\*\*\s*(.+)', content, re.IGNORECASE)
    customer = re.search(r'\*\*Customer:\*\*\s*(.+)', content, re.IGNORECASE)
    sent = re.search(r'\*\*Sent date:\*\*\s*(.+)', content, re.IGNORECASE)

    print(f"Project: {proj_id}")
    if customer:
        print(f"Customer: {customer.group(1).strip()}")
    print(f"Status: {status.group(1).strip() if status else '?'}")
    print(f"Revision: {rev.group(1).strip() if rev else '?'}")
    print(f"Due: {due.group(1).strip() if due else '—'}")
    if sent:
        print(f"Sent: {sent.group(1).strip()}")

def cmd_list():
    """List all projects."""
    if not os.path.exists(PROJECTS_DIR):
        print("No projects directory found")
        return

    projects = []
    for d in os.listdir(PROJECTS_DIR):
        meta_path = os.path.join(PROJECTS_DIR, d, "meta.md")
        if os.path.isdir(os.path.join(PROJECTS_DIR, d)) and d != 'index.md' and os.path.exists(meta_path):
            projects.append(d)

    projects.sort()
    for p in projects:
        data = {'project_id': p}
        meta_path = os.path.join(PROJECTS_DIR, p, "meta.md")
        with open(meta_path, 'r') as f:
            content = f.read()

        status = re.search(r'\*\*Status:\*\*\s*(.+)', content, re.IGNORECASE)
        rev = re.search(r'\*\*Revision:\*\*\s*(.+)', content, re.IGNORECASE)
        due = re.search(r'\*\*Due date:\*\*\s*(.+)', content, re.IGNORECASE)
        customer = re.search(r'\*\*Customer:\*\*\s*(.+)', content, re.IGNORECASE)

        status_s = status.group(1).strip() if status else '?'
        rev_s = rev.group(1).strip() if rev else '?'
        due_s = due.group(1).strip() if due else '—'
        cust_s = customer.group(1).strip() if customer else '—'

        print(f"{p}: {status_s} | {rev_s} | {cust_s} | due {due_s}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "update":
        if len(sys.argv) < 3:
            print("Usage: tracker.py update <update text>")
            sys.exit(1)
        cmd_update(" ".join(sys.argv[2:]))
    elif cmd == "status":
        cmd_status(sys.argv[2] if len(sys.argv) > 2 else None)
    elif cmd == "list":
        cmd_list()
    else:
        print(f"Unknown command: {cmd}")
        print(__doc__)
        sys.exit(1)
