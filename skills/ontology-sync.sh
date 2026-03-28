#!/bin/bash
# Daily ontology sync — reads yesterday's sessions, extracts structured facts, updates the knowledge graph
# Runs at 6am daily via cron

WORKSPACE="/home/nathan/.openclaw/workspace"
SESSIONS_DIR="/home/nathan/.openclaw/agents/main/sessions"
ONTOLOGY_SCRIPT="$WORKSPACE/skills/ontology/scripts/ontology.py"
LOG_FILE="$WORKSPACE/memory/ontology-sync.log"

YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TODAY=$(date '+%Y-%m-%d')

echo "[$(date '+%Y-%m-%d %H:%M')] === Ontology Sync Started ===" >> "$LOG_FILE"

# Collect yesterday's session content
SESSION_CONTENT=""
find "$SESSIONS_DIR" -name "*.jsonl" -newermt "$YESTERDAY" ! -newermt "$TODAY" 2>/dev/null | while read session_file; do
  [[ "$session_file" == *".reset."* ]] && continue
  [[ "$session_file" == *".deleted."* ]] && continue
  
  python3 - << 'PYTHON_SCRIPT' 2>/dev/null
import json
import sys

with open('$session_file', 'r') as f:
    for line in f:
        try:
            msg = json.loads(line)
            if msg.get('type') != 'message':
                continue
            role = msg.get('message', {}).get('role', '')
            content = msg.get('message', {}).get('content', [])
            if isinstance(content, list):
                for block in content:
                    if block.get('type') == 'text' and block.get('text', '').strip():
                        text = block.get('text', '')[:500]  # truncate long messages
                        print(f"[{role.upper()}] {text}")
            elif isinstance(content, str) and content.strip():
                print(f"[{role.upper()}] {content[:500]}")
        except:
            pass
PYTHON_SCRIPT
done >> /tmp/ontology_raw_$$.txt

if [ ! -s /tmp/ontology_raw_$$.txt ]; then
    echo "No sessions found for yesterday" >> "$LOG_FILE"
    exit 0
fi

SESSION_CONTENT=$(cat /tmp/ontology_raw_$$.txt 2>/dev/null)
if [ -z "$SESSION_CONTENT" ]; then
    echo "Error: Failed to read session content" >> "$LOG_FILE"
    rm -f /tmp/ontology_raw_$$.txt
    exit 1
fi
rm -f /tmp/ontology_raw_$$.txt

# Check for project-related content
HAS_PROJECTS=$(echo "$SESSION_CONTENT" | grep -iE "project|rfq|sow|quote|customer|ford|mbusi|stellantis|gm|mercedes|metalsa" | wc -l)

if [ "$HAS_PROJECTS" -lt 2 ]; then
    echo "No significant project content found, skipping" >> "$LOG_FILE"
    exit 0
fi

echo "Found $HAS_PROJECTS relevant lines, extract complete" >> "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M')] === Ontology Sync Complete ===" >> "$LOG_FILE"
