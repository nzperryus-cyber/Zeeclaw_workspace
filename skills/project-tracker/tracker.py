#!/usr/bin/env python3
"""
Project Tracker — robust project tracking with SQLite index and meta.md source of truth
Usage:
  tracker.py list [--status STATUS] [--customer CUSTOMER]
  tracker.py status PROJECT_ID
  tracker.py update "25-67725 rev 2 is quoting due 4/7/26"
  tracker.py add PROJECT_ID --customer FORD --description "Project description"
  tracker.py archive PROJECT_ID
  tracker.py sync
"""

import os
import re
import sys
import json
import sqlite3
import subprocess
from datetime import datetime
from pathlib import Path

WORKSPACE = "/home/nathan/.openclaw/workspace"
PROJECTS_DIR = os.path.join(WORKSPACE, "projects")
REGISTRY_DB = os.path.join(PROJECTS_DIR, "registry.db")
ONTOLOGY_SCRIPT = os.path.join(WORKSPACE, "skills/ontology/scripts/ontology.py")
LOG_FILE = os.path.join(WORKSPACE, "memory", "ontology", "project-tracker.log")

STATUS_MAP = {
    'quoting': 'quoting', 'quote': 'quoting', 'q': 'quoting', 'rev': 'quoting',
    'sent': 'sent', 'send': 'sent',
    'awarded': 'awarded', 'won': 'awarded',
    'lost': 'lost',
    'mothballed': 'mothballed', 'mothball': 'mothballed', 'parked': 'mothballed',
    'new': 'new',
    'active': 'active',
    'completed': 'completed', 'done': 'completed', 'finish': 'completed',
    'paused': 'paused', 'hold': 'paused', 'on hold': 'paused',
}

PROJECT_FOLDERS = ["meetings", "quotes", "rfq", "sows"]


def log(msg):
    ts = datetime.now().strftime("%Y-%m-%d %H:%M")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{ts}] {msg}\n")


def get_db():
    conn = sqlite3.connect(REGISTRY_DB)
    conn.row_factory = sqlite3.Row
    return conn


def init_db():
    conn = get_db()
    c = conn.cursor()
    c.execute("""
        CREATE TABLE IF NOT EXISTS projects (
            project_id TEXT PRIMARY KEY,
            customer TEXT,
            status TEXT DEFAULT 'new',
            rev INTEGER DEFAULT 0,
            due_date TEXT,
            sent_date TEXT,
            description TEXT,
            folder TEXT,
            archived INTEGER DEFAULT 0,
            created INTEGER,
            updated INTEGER
        )
    """)
    c.execute("""
        CREATE TABLE IF NOT EXISTS audit_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            project_id TEXT,
            field TEXT,
            old_value TEXT,
            new_value TEXT,
            ts INTEGER,
            FOREIGN KEY (project_id) REFERENCES projects(project_id)
        )
    """)
    c.execute("CREATE INDEX IF NOT EXISTS idx_status ON projects(status)")
    c.execute("CREATE INDEX IF NOT EXISTS idx_customer ON projects(customer)")
    c.execute("CREATE INDEX IF NOT EXISTS idx_archived ON projects(archived)")
    conn.commit()
    conn.close()


def parse_meta(content):
    """Parse meta.md content into dict of sections."""
    result = {}
    if not content:
        return result

    # Split by ## section headers (sections start with ## and are separated by blank lines)
    # First split: split by lines starting with ##
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith('## '):
            section_name = line[3:].strip()
            # Collect body until next ## or end
            body_lines = []
            i += 1
            # Skip blank lines after header
            while i < len(lines) and lines[i].strip() == '':
                i += 1
            while i < len(lines) and not lines[i].startswith('## '):
                body_lines.append(lines[i])
                i += 1
            body = '\n'.join(body_lines).strip()

            if section_name == 'Status':
                for bline in body.split('\n'):
                    m = re.match(r'^-\s+\*\*Status:\*\*\s*(.+)', bline, re.IGNORECASE)
                    if m: result['status'] = m.group(1).strip()
                    m = re.match(r'^-\s+\*\*Revision:\*\*\s*(.+)', bline, re.IGNORECASE)
                    if m: result['rev'] = m.group(1).strip()
                    m = re.match(r'^-\s+\*\*Due date:\*\*\s*(.+)', bline, re.IGNORECASE)
                    if m: result['due'] = m.group(1).strip()
                    m = re.match(r'^-\s+\*\*Customer:\*\*\s*(.+)', bline, re.IGNORECASE)
                    if m: result['customer'] = m.group(1).strip()
                    m = re.match(r'^-\s+\*\*Sent date:\*\*\s*(.+)', bline, re.IGNORECASE)
                    if m: result['sent_date'] = m.group(1).strip()
            elif section_name == 'Notes':
                result['notes'] = body
            elif section_name == 'History':
                result['history'] = body
        else:
            # Title line
            if line.startswith('# '):
                result['_title'] = line
                m = re.match(r'^#\s+\S+\s+—\s+(.+?)\s+—', line)
                if m:
                    result['_title_customer'] = m.group(1).strip()
            i += 1

    return result


def parse_update(text):
    text = text.strip()
    result = {'project_id': None, 'status': None, 'rev': None, 'due': None, 'customer': None, 'note': None}

    proj_match = re.search(r'\b(\d{2}-\d{5})\b', text)
    if proj_match:
        result['project_id'] = proj_match.group(1)

    rev_match = re.search(r'\brev(?:ision)?\s*(\d+)\b', text, re.IGNORECASE)
    if rev_match:
        result['rev'] = int(rev_match.group(1))

    lower_text = text.lower()
    for kw, status in STATUS_MAP.items():
        if kw in lower_text:
            result['status'] = status
            break

    due_match = re.search(r'\bdue\s+(ASAP|[\d/\-]+(?:th|rd|nd|st)?(?:[\s,]+(?:jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*[\s,]*\d{2,4})?)\b', text, re.IGNORECASE)
    if due_match:
        due_val = due_match.group(1).strip()
        result['due'] = 'ASAP' if due_val.upper() == 'ASAP' else normalize_date(due_val)

    customer_match = re.search(r'\b(Ford|Mercedes|MBUSI|Stellantis|Metalsa|GM|BMW|Toyota)\b', text, re.IGNORECASE)
    if customer_match:
        c = customer_match.group(1)
        result['customer'] = c.title() if c.lower() != 'mbusi' else 'MBUSI'

    note_match = re.search(r'(?:note[s]?:|//|--)\s*(.+?)(?:\s+(?:rev|status|due|customer)\b|$)', text, re.IGNORECASE)
    if note_match:
        result['note'] = note_match.group(1).strip().rstrip('.')
    elif re.search(r'\b(timing|limitation|schedule|waiting|blocked|pending)\b', text, re.IGNORECASE):
        phrase = re.search(r'(timing\s*limitation|cannot\s+quote|schedule\s*limitation|waiting\s+for)', text, re.IGNORECASE)
        if phrase:
            result['note'] = phrase.group(1).strip()

    return result


def normalize_date(date_str):
    date_str = date_str.strip()
    if re.match(r'^\d{4}-\d{2}-\d{2}$', date_str):
        return date_str
    m = re.match(r'^(\d{1,2})/(\d{1,2})/(\d{2,4})$', date_str)
    if m:
        month, day, year = m.groups()
        if len(year) == 2:
            year = '20' + year if int(year) < 50 else '19' + year
        return f"{year}-{int(month):02d}-{int(day):02d}"
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
    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")
    if not os.path.exists(meta_path):
        return None
    with open(meta_path, 'r') as f:
        return f.read()


def write_meta(proj_id, data, existing_content=None):
    today = datetime.now().strftime("%Y-%m-%d")
    existing = parse_meta(existing_content) if existing_content else {}

    status = data.get('status') or existing.get('status', 'new')
    rev = data.get('rev') if data.get('rev') is not None else existing.get('rev', 'Rev 0')
    due = data.get('due') or existing.get('due', '')
    customer = data.get('customer') or existing.get('customer') or existing.get('_title_customer', '')
    note = data.get('note')

    rev_display = f"Rev {rev}" if isinstance(rev, int) else rev

    # History
    history_parts = []
    if existing.get('history'):
        history_parts.append(existing['history'])

    changes = []
    if data.get('status') and data['status'] != existing.get('status', '').lower():
        changes.append(status.title())
    if data.get('rev') is not None and str(data['rev']) not in str(existing.get('rev', '')):
        changes.append(f"Rev {data['rev']}")
    if data.get('due') and data['due'] != existing.get('due', ''):
        changes.append(f"due {data['due']}")
    if note:
        changes.append(note)

    if changes:
        history_parts.append(f"- {today} — {' '.join(changes)}")

    history_block = "\n".join(history_parts) if history_parts else f"- {today} — Project created"

    # Notes
    notes_lines = []
    if existing.get('notes'):
        notes_lines.append(existing['notes'])
    if note:
        notes_lines.append(note)
    notes_content = "\n".join(notes_lines) + "\n" if notes_lines else ""

    # Title
    title = existing.get('_title', f"# {proj_id} — {customer or 'Project'}")

    return f"""{title}

## Status
- **Status:** {status.title() if status else 'New'}
- **Revision:** {rev_display}
- **Due date:** {due}
- **Customer:** {customer}

## Notes
{notes_content}## History
{history_block}
"""


def create_project_folders(proj_id):
    proj_dir = os.path.join(PROJECTS_DIR, proj_id)
    os.makedirs(proj_dir, exist_ok=True)
    for folder in PROJECT_FOLDERS:
        os.makedirs(os.path.join(proj_dir, folder), exist_ok=True)
    return proj_dir


def db_upsert(proj_id, data):
    conn = get_db()
    c = conn.cursor()
    now = int(datetime.now().timestamp())

    c.execute("SELECT * FROM projects WHERE project_id = ?", (proj_id,))
    row = c.fetchone()
    old = dict(row) if row else None

    fields = ['updated = ?']
    values = [now]
    for key in ['customer', 'status', 'rev', 'due_date', 'sent_date', 'description', 'folder']:
        if key in data and data[key] is not None:
            fields.append(f"{key} = ?")
            values.append(data[key])

    values.append(proj_id)
    c.execute(f"UPDATE projects SET {', '.join(fields)} WHERE project_id = ?", values)
    if c.rowcount == 0:
        c.execute("""
            INSERT INTO projects (project_id, customer, status, rev, due_date, sent_date, description, folder, created, updated)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (proj_id, data.get('customer', ''), data.get('status', 'new'),
              data.get('rev', 0), data.get('due_date', ''), data.get('sent_date', ''),
              data.get('description', ''), data.get('folder', f'projects/{proj_id}/'), now, now))

    if old:
        for key in ['status', 'rev', 'due_date', 'customer']:
            old_val = str(old.get(key) or '')
            new_val = str(data.get(key) or '')
            if new_val and new_val != old_val:
                c.execute("INSERT INTO audit_log (project_id, field, old_value, new_value, ts) VALUES (?, ?, ?, ?, ?)",
                          (proj_id, key, old_val, new_val, now))

    conn.commit()
    conn.close()


def sync_to_ontology(proj_id, props):
    entity_id = 'proj_' + proj_id.replace('-', '_')
    props_json = json.dumps(props).replace("'", "'\\''")
    cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} update --id {entity_id} --props '{props_json}'"
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        return result.returncode == 0
    except:
        return False


def cmd_list(status=None, customer=None, format='plain'):
    init_db()
    conn = get_db()
    query = "SELECT * FROM projects WHERE archived = 0"
    params = []
    if status:
        query += " AND status = ?"
        params.append(status)
    if customer:
        query += " AND customer = ?"
        params.append(customer)
    query += " ORDER BY project_id"
    rows = conn.execute(query, params).fetchall()
    conn.close()

    if not rows:
        print("No projects found.")
        return

    if format == 'json':
        print(json.dumps([dict(r) for r in rows], indent=2))
        return

    print(f"{'Project':<12} {'Customer':<18} {'Status':<12} {'Rev':<6} {'Due':<12}")
    print("-" * 70)
    for r in rows:
        due = r['due_date'] or '—'
        rev = f"Rev {r['rev']}" if r['rev'] is not None else '—'
        print(f"{r['project_id']:<12} {(r['customer'] or '—'):<18} {r['status'] or '—':<12} {rev:<6} {due:<12}")
    print(f"\n{len(rows)} project(s)")


def cmd_status(proj_id):
    init_db()
    conn = get_db()
    row = conn.execute("SELECT * FROM projects WHERE project_id = ?", (proj_id,)).fetchone()
    conn.close()
    if not row:
        print(f"ERROR: Project {proj_id} not found in registry")
        sys.exit(1)
    r = dict(row)
    print(f"Project: {proj_id}")
    print(f"Customer: {r['customer'] or '—'}")
    print(f"Status: {r['status'] or '—'}")
    print(f"Revision: {r['rev'] if r['rev'] is not None else '—'}")
    print(f"Due: {r['due_date'] or '—'}")
    print(f"Sent: {r['sent_date'] or '—'}")
    print(f"Description: {r['description'] or '—'}")


def cmd_add(proj_id, customer=None, description=None, status='new'):
    proj_dir = os.path.join(PROJECTS_DIR, proj_id)
    if os.path.exists(proj_dir):
        print(f"ERROR: Project {proj_id} already exists")
        sys.exit(1)
    if not re.match(r'^\d{2}-\d{5}$', proj_id):
        print(f"ERROR: Invalid project ID format: {proj_id} (expected XX-XXXXX)")
        sys.exit(1)

    create_project_folders(proj_id)

    data = {'status': status, 'rev': 0, 'customer': customer or '', 'due': '', 'description': description or f"Project {proj_id}"}
    meta_content = write_meta(proj_id, data)
    with open(os.path.join(proj_dir, "meta.md"), 'w') as f:
        f.write(meta_content)

    init_db()
    db_upsert(proj_id, {
        'customer': customer or '',
        'status': status,
        'rev': 0,
        'due_date': '',
        'description': description or f"Project {proj_id}",
        'folder': f'projects/{proj_id}/',
    })

    log(f"ADD {proj_id}: customer={customer}, description={description}")
    sync_to_ontology(proj_id, {'status': status, 'customer': customer, 'description': description, 'project_id': proj_id})
    print(f"Created project {proj_id} at {proj_dir}")


def cmd_update(text):
    if not text:
        print("ERROR: No update text provided")
        sys.exit(1)

    data = parse_update(text)
    if not data['project_id']:
        print("ERROR: Could not find project ID (format: XX-XXXXX)")
        sys.exit(1)

    proj_id = data['project_id']
    meta_path = os.path.join(PROJECTS_DIR, proj_id, "meta.md")
    if not os.path.exists(meta_path):
        print(f"ERROR: Project {proj_id} does not exist. Use 'tracker.py add {proj_id} ...' to create it.")
        sys.exit(1)

    existing_content = read_meta(proj_id)
    new_meta = write_meta(proj_id, data, existing_content)
    with open(meta_path, 'w') as f:
        f.write(new_meta)

    db_data = {}
    if data.get('status'): db_data['status'] = data['status']
    if data.get('rev') is not None: db_data['rev'] = data['rev']
    if data.get('due'): db_data['due_date'] = data['due']
    if data.get('customer'): db_data['customer'] = data['customer']

    if db_data:
        db_upsert(proj_id, db_data)

    log(f"UPDATE {proj_id}: status={data['status']} rev={data['rev']} due={data['due']}")

    ont_props = {}
    if data.get('status'): ont_props['status'] = data['status']
    if data.get('rev') is not None: ont_props['rev'] = f"Rev {data['rev']}"
    if data.get('due'): ont_props['due'] = data['due']
    if data.get('customer'): ont_props['customer'] = data['customer']
    if ont_props:
        sync_to_ontology(proj_id, ont_props)

    parts = [p for p in [data.get('status'), f"Rev {data['rev']}" if data.get('rev') is not None else None,
                          f"due {data['due']}" if data.get('due') else None, data.get('note')] if p]
    print(f"Updated {proj_id}: {', '.join(parts)}")


def cmd_sync():
    init_db()
    count = 0
    for proj_dir in sorted(Path(PROJECTS_DIR).iterdir()):
        if not proj_dir.is_dir() or proj_dir.name.startswith('_'):
            continue
        meta_path = proj_dir / "meta.md"
        if not meta_path.exists():
            continue
        proj_id = proj_dir.name
        with open(meta_path, 'r') as f:
            content = f.read()
        parsed = parse_meta(content)
        db_data = {
            'status': parsed.get('status', 'new'),
            'rev': 0,
            'folder': f'projects/{proj_id}/',
            'description': proj_id,
        }
        rev_str = parsed.get('rev', 'Rev 0')
        rev_num = re.search(r'\d+', rev_str)
        db_data['rev'] = int(rev_num.group()) if rev_num else 0
        if parsed.get('customer'): db_data['customer'] = parsed['customer']
        if parsed.get('due'): db_data['due_date'] = parsed['due']
        if parsed.get('sent_date'): db_data['sent_date'] = parsed['sent_date']
        db_upsert(proj_id, db_data)
        count += 1
    print(f"Synced {count} projects to registry")


def cmd_archive(proj_id):
    proj_dir = os.path.join(PROJECTS_DIR, proj_id)
    archive_dir = os.path.join(PROJECTS_DIR, "_archived", proj_id)
    if not os.path.exists(proj_dir):
        print(f"ERROR: Project {proj_id} does not exist")
        sys.exit(1)
    os.makedirs(os.path.dirname(archive_dir), exist_ok=True)
    os.rename(proj_dir, archive_dir)
    conn = get_db()
    conn.execute("UPDATE projects SET archived = 1, folder = ? WHERE project_id = ?",
                 (f'projects/_archived/{proj_id}/', proj_id))
    conn.commit()
    conn.close()
    log(f"ARCHIVE {proj_id}")
    print(f"Archived {proj_id}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "list":
        status, customer, fmt = None, None, 'plain'
        args = sys.argv[2:]
        i = 0
        while i < len(args):
            if args[i] == "--status" and i+1 < len(args): status = args[i+1]; i += 2
            elif args[i] == "--customer" and i+1 < len(args): customer = args[i+1]; i += 2
            elif args[i] == "--format" and i+1 < len(args): fmt = args[i+1]; i += 2
            else: i += 1
        cmd_list(status, customer, fmt)

    elif cmd == "status":
        if len(sys.argv) < 3:
            print("Usage: tracker.py status PROJECT_ID"); sys.exit(1)
        cmd_status(sys.argv[2])

    elif cmd == "add":
        proj_id, customer, description = None, None, None
        args = sys.argv[2:]
        i = 0
        while i < len(args):
            if args[i] == "--customer" and i+1 < len(args): customer = args[i+1]; i += 2
            elif args[i] == "--description" and i+1 < len(args): description = args[i+1]; i += 2
            elif not args[i].startswith("--"): proj_id = args[i]; i += 1
            else: i += 1
        if not proj_id:
            print("Usage: tracker.py add PROJECT_ID [--customer X] [--description X]"); sys.exit(1)
        cmd_add(proj_id, customer, description)

    elif cmd == "update":
        if len(sys.argv) < 3:
            print("Usage: tracker.py update 'text'"); sys.exit(1)
        cmd_update(" ".join(sys.argv[2:]))

    elif cmd == "sync":
        cmd_sync()

    elif cmd == "archive":
        if len(sys.argv) < 3:
            print("Usage: tracker.py archive PROJECT_ID"); sys.exit(1)
        cmd_archive(sys.argv[2])

    else:
        print(f"Unknown command: {cmd}")
        print(__doc__)
        sys.exit(1)
