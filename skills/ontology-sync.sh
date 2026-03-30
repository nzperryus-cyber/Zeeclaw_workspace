#!/bin/bash
# Daily ontology sync — reads yesterday's sessions, extracts structured facts via LLM, updates the knowledge graph
# Runs at 6am daily via cron

WORKSPACE="/home/nathan/.openclaw/workspace"
SESSIONS_DIR="/home/nathan/.openclaw/agents/main/sessions"
ONTOLOGY_SCRIPT="$WORKSPACE/skills/ontology/scripts/ontology.py"
MEMORY_DIR="$WORKSPACE/memory/ontology"
LOG_FILE="$MEMORY_DIR/ontology-sync.log"
TMP_CONTENT="/tmp/ontology_content_$$.txt"
TMP_FACTS="/tmp/ontology_facts_$$.json"

YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TODAY=$(date '+%Y-%m-%d')

echo "[$(date '+%Y-%m-%d %H:%M')] === Ontology Sync Started ===" >> "$LOG_FILE"

mkdir -p "$MEMORY_DIR"

# --- Step 1: Collect yesterday's session content ---
find "$SESSIONS_DIR" -name "*.jsonl" -newermt "$YESTERDAY" ! -newermt "$TODAY" 2>/dev/null | sort | while read session_file; do
  [[ "$session_file" == *".reset."* ]] && continue
  [[ "$session_file" == *".deleted."* ]] && continue

  python3 - << 'PYTHON_SCRIPT' 2>/dev/null
import json
import sys

session_file = '$session_file'
with open(session_file, 'r') as f:
    for line in f:
        try:
            msg = json.loads(line)
            if msg.get('type') != 'message':
                continue
            content = msg.get('message', {}).get('content', [])
            if isinstance(content, list):
                for block in content:
                    if block.get('type') == 'text' and block.get('text', '').strip():
                        text = block.get('text', '')[:2000]
                        print(text)
            elif isinstance(content, str) and content.strip():
                print(content[:2000])
        except:
            pass
PYTHON_SCRIPT
done > "$TMP_CONTENT"

if [ ! -s "$TMP_CONTENT" ]; then
    echo "No sessions found for yesterday" >> "$LOG_FILE"
    exit 0
fi

CONTENT_SIZE=$(wc -c < "$TMP_CONTENT")
echo "Collected ${CONTENT_SIZE} bytes of session content" >> "$LOG_FILE"

# --- Step 2: Use LLM to extract structured facts ---
PROMPT="You are an ontology extraction assistant. Read the following conversation transcript and extract all factual updates for a project tracking knowledge graph.

Extract entities and relations in this JSON format (array of operations):
[
  {\"op\": \"create\" | \"update\", \"type\": \"Project|Person|Organization\", \"id\": \"optional-id\", \"props\": {\"key\": \"value\"}},

For Projects, extract:
- project_id (format: XX-XXXXX)
- status (quoting, sent, awarded, lost, paused, completed)
- customer (Ford, GM, MBUSI, Stellantis, Mercedes, etc.)
- description
- revision number
- due date
- sent date
- any other notable facts

For People, extract:
- name
- email
- company/organization
- role

For Organizations (customers):
- name
- type (automotive OEM, supplier, etc.)

Return ONLY valid JSON array. No explanation, no markdown, just the array.
If no significant facts found, return: []

---
CONVERSATION TRANSCRIPT:
$(cat "$TMP_CONTENT")
---
JSON OUTPUT:"

EXTRACTION=$(echo "$PROMPT" | ollama run phi4-mini:latest --quiet 2>/dev/null)

# Clean up the extraction - remove any markdown code blocks
EXTRACTION=$(echo "$EXTRACTION" | sed 's/```json//g' | sed 's/```//g' | sed '/^\s*$/d' | tr -d '\n')

echo "$EXTRACTION" > "$TMP_FACTS"

# Validate it's valid JSON
if ! python3 -c "import json; json.load(open('$TMP_FACTS'))" 2>/dev/null; then
    echo "LLM output was not valid JSON, skipping" >> "$LOG_FILE"
    echo "LLM output was: $(cat "$TMP_FACTS")" >> "$LOG_FILE"
    rm -f "$TMP_CONTENT" "$TMP_FACTS"
    exit 0
fi

FACT_COUNT=$(python3 -c "import json; print(len(json.load(open('$TMP_FACTS'))))" 2>/dev/null)
echo "Extracted $FACT_COUNT facts" >> "$LOG_FILE"

if [ "$FACT_COUNT" -eq 0 ]; then
    echo "No facts to sync" >> "$LOG_FILE"
    rm -f "$TMP_CONTENT" "$TMP_FACTS"
    exit 0
fi

# --- Step 3: Apply facts to ontology ---
python3 - << 'PYTHON_SCRIPT' 2>> "$LOG_FILE"
import json
import subprocess
import sys
import re

FACTS_FILE = "$TMP_FACTS"
ONTOLOGY_SCRIPT = "$ONTOLOGY_SCRIPT"
WORKSPACE = "$WORKSPACE"

with open(FACTS_FILE) as f:
    facts = json.load(f)

for fact in facts:
    op = fact.get('op', 'create')
    entity_type = fact.get('type', '')
    entity_id = fact.get('id', '')
    props = fact.get('props', {})

    if not props:
        continue

    # Build entity ID from project_id if not provided
    if not entity_id and entity_type == 'Project':
        project_id = props.get('project_id', '')
        if project_id:
            # Normalize project_id to ontology id format: proj_XX_XXXXX
            entity_id = 'proj_' + project_id.replace('-', '_')

    # Escape props for shell
    props_json = json.dumps(props).replace("'", "'\\''")

    try:
        if op == 'create':
            cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} create --type {entity_type} --props '{props_json}'"
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
            if result.returncode == 0:
                print(f"Created {entity_type}: {entity_id or 'new'}", file=sys.stderr)
            else:
                print(f"Create failed: {result.stderr[:200]}", file=sys.stderr)

        elif op == 'update' and entity_id:
            cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} update --id {entity_id} --props '{props_json}'"
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
            if result.returncode == 0:
                print(f"Updated {entity_id}", file=sys.stderr)
            else:
                print(f"Update failed: {result.stderr[:200]}", file=sys.stderr)

        elif op == 'relate':
            from_id = fact.get('from', '')
            rel = fact.get('rel', '')
            to = fact.get('to', '')
            if from_id and rel and to:
                cmd = f"cd {WORKSPACE} && python3 {ONTOLOGY_SCRIPT} relate --from {from_id} --rel {rel} --to {to}"
                result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
                if result.returncode == 0:
                    print(f"Related {from_id} --{rel}--> {to}", file=sys.stderr)

    except Exception as e:
        print(f"Error processing fact: {e}", file=sys.stderr)
        continue

print(f"Processed {len(facts)} facts", file=sys.stderr)
PYTHON_SCRIPT

rm -f "$TMP_CONTENT" "$TMP_FACTS"

echo "[$(date '+%Y-%m-%d %H:%M')] === Ontology Sync Complete ===" >> "$LOG_FILE"
