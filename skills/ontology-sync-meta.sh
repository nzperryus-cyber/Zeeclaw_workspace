#!/bin/bash
# meta-to-ontology sync — reads all project meta.md files, upserts to the knowledge graph
# Runs from morning-briefing.sh or can be run standalone

WORKSPACE="/home/nathan/.openclaw/workspace"
ONTOLOGY_SCRIPT="$WORKSPACE/skills/ontology/scripts/ontology.py"
MEMORY_DIR="$WORKSPACE/memory/ontology"
LOG_FILE="$MEMORY_DIR/ontology-sync.log"
TMP_UPDATES="/tmp/meta_updates_$$.sh"

YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TODAY=$(date '+%Y-%m-%d')
UPDATED=0
CREATED=0
ERRORS=0

echo "[$(date '+%Y-%m-%d %H:%M')] === Meta→Ontology Sync Started ===" >> "$LOG_FILE"
mkdir -p "$MEMORY_DIR"

# Collect all updates into a temp script to avoid repeated ontology.py spawns
# We'll use a single Python script to do everything

python3 - << 'PYTHON_SCRIPT'
import os
import re
import subprocess
import json
from pathlib import Path

WORKSPACE = os.environ.get('WORKSPACE', '/home/nathan/.openclaw/workspace')
ONTOLOGY_SCRIPT = os.path.join(WORKSPACE, 'skills/ontology/scripts/ontology.py')
LOG_FILE = os.path.join(WORKSPACE, 'memory/ontology/ontology-sync.log')
PROJECTS_DIR = os.path.join(WORKSPACE, 'projects')

def log(msg):
    with open(LOG_FILE, 'a') as f:
        f.write(f"[{os.popen('date \"+%Y-%m-%d %H:%M\"').read().strip()}] {msg}\n")

def parse_meta(meta_path):
    """Parse a meta.md file and extract project properties."""
    try:
        with open(meta_path, 'r') as f:
            content = f.read()
    except Exception as e:
        return None, f"Failed to read {meta_path}: {e}"

    # Extract project_id from filename (e.g., 25-72998 from /path/25-72998/meta.md)
    project_id = Path(meta_path).parent.name  # e.g., "25-72998"
    if not re.match(r'\d+-\d+', project_id):
        return None, f"Invalid project_id format: {project_id}"

    # Build entity_id: proj_25_72998 (always use underscores)
    entity_id = 'proj_' + project_id.replace('-', '_')

    props = {'project_id': project_id}

    # Parse Status — handle "rev X sent" compound format
    status_match = re.search(r'\*\*Status:\*\*\s*(.+)', content)
    if status_match:
        raw_status = status_match.group(1).strip().lower()
        # Handle compound "rev X sent" format
        if 'rev' in raw_status and 'sent' in raw_status:
            # Extract revision number
            rev_num = re.search(r'rev\s*(\d+)', raw_status)
            if rev_num:
                props['rev'] = f"Rev {rev_num.group(1)}"
            props['status'] = 'sent'
        elif 'rev' in raw_status:
            rev_num = re.search(r'rev\s*(\d+)', raw_status)
            if rev_num:
                props['rev'] = f"Rev {rev_num.group(1)}"
            props['status'] = 'rev'
        else:
            status_map = {
                'quoting': 'quoting', 'quote': 'quoting', 'q': 'quoting',
                'sent': 'sent',
                'awarded': 'awarded', 'won': 'awarded',
                'lost': 'lost',
                'mothballed': 'mothballed', 'mothball': 'mothballed',
                'new': 'new',
                'active': 'active',
                'completed': 'completed', 'done': 'completed',
                'paused': 'paused', 'on hold': 'paused',
            }
            props['status'] = status_map.get(raw_status, raw_status)

    # Parse Revision
    rev_match = re.search(r'\*\*Revision:\*\*\s*(.+)', content)
    if rev_match:
        props['rev'] = rev_match.group(1).strip()

    # Parse Sent date
    sent_match = re.search(r'\*\*Sent date:\*\*\s*(.+)', content)
    if sent_match:
        props['sent_date'] = sent_match.group(1).strip()

    # Parse Due date
    due_match = re.search(r'\*\*Due date:\*\*\s*(.+)', content)
    if due_match:
        props['due'] = due_match.group(1).strip()

    # Parse Customer
    customer_match = re.search(r'\*\*Customer:\*\*\s*(.+)', content)
    if customer_match:
        props['customer'] = customer_match.group(1).strip()

    # Parse Description (first H1 or H2 line)
    desc_match = re.search(r'^#\s+\S+\s+—\s+(.+)\s*$', content, re.MULTILINE)
    if desc_match:
        props['description'] = desc_match.group(1).strip()

    # Parse Notes section (everything after "## Notes" until next ## heading)
    notes_match = re.search(r'## Notes\s*\n+(.*?)(?=\n##|\Z)', content, re.DOTALL)
    if notes_match:
        notes_text = notes_match.group(1).strip()
        # Skip empty notes or placeholder text
        if notes_text and notes_text not in ['None', '-', '']:
            props['notes'] = notes_text

    return entity_id, props

def call_ontology(entity_id, props):
    """Call ontology.py to upsert an entity."""
    props_json = json.dumps(props).replace("'", "'\\''")
    cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} update --id {entity_id} --props '{props_json}'"
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        if result.returncode == 0:
            return True, None
        else:
            err = result.stderr.strip() or result.stdout.strip()
            return False, err[:200]
    except Exception as e:
        return False, str(e)[:200]

# Main sync
updated = 0
created = 0
errors = 0
projects_dir = Path(PROJECTS_DIR)

if not projects_dir.exists():
    log(f"Projects directory not found: {PROJECTS_DIR}")
else:
    meta_files = list(projects_dir.glob("*/meta.md"))
    log(f"Found {len(meta_files)} project meta.md files")

    for meta_file in sorted(meta_files):
        entity_id, result = parse_meta(str(meta_file))

        if entity_id is None:
            log(f"SKIP {meta_file.parent.name}: {result}")
            continue

        # Get existing entity to merge (don't clobber notes we don't have)
        # For now, just upsert what we parsed — meta.md is source of truth
        ok, err = call_ontology(entity_id, result)

        if ok:
            log(f"UPSERT {entity_id}: {result.get('status','?')} | {result.get('customer','?')}")
            updated += 1
        else:
            log(f"ERROR {entity_id}: {err}")
            errors += 1

log(f"Meta→Ontology Sync: {updated} upserted, {errors} errors")
print(f"SYNC: {updated} upserted, {errors} errors")
PYTHON_SCRIPT

echo "[$(date '+%Y-%m-%d %H:%M')] === Meta→Ontology Sync Complete ===" >> "$LOG_FILE"
