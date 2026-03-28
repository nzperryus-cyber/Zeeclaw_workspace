#!/bin/bash
# Export projects from ontology graph to markdown

GRAPH_FILE="/home/nathan/.openclaw/workspace/memory/ontology/graph.jsonl"
OUTPUT_FILE="/home/nathan/.openclaw/workspace/projects/index.md"

echo "# Projects Index" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "| Project # | Customer | Description | Status with rev # | Due/Sent Date |" >> "$OUTPUT_FILE"
echo "|-----------|----------|-------------|-------------------|---------------|" >> "$OUTPUT_FILE"

# Extract projects from graph, sort by due date
python3 << 'EOF'
import json
import sys

GRAPH_PATH = "/home/nathan/.openclaw/workspace/memory/ontology/graph.jsonl"
projects = []

try:
    with open(GRAPH_PATH) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                data = json.loads(line)
                if data.get("entity", {}).get("type") == "Project":
                    p = data["entity"]["properties"]
                    proj_id = p.get("project_id", "")
                    customer = p.get("customer", "")
                    desc = p.get("name", "")
                    status = p.get("status", "")
                    rev = p.get("rev", "")
                    due = p.get("due", p.get("sent_date", ""))
                    due_date = f"due {due}" if p.get("due") else f"sent {due}" if p.get("sent_date") else ""
                    status_rev = f"{status} rev {rev}" if rev else status
                    if proj_id:
                        projects.append((proj_id, customer, desc, status_rev, due_date))
            except json.JSONDecodeError:
                continue  # skip malformed lines
except FileNotFoundError:
    print(f"Error: Graph file not found: {GRAPH_PATH}", file=sys.stderr)
    sys.exit(1)
except Exception as e:
    print(f"Error reading graph: {e}", file=sys.stderr)
    sys.exit(1)

# Sort by due date (newest first)
from datetime import datetime
def sort_key(p):
    try:
        return datetime.strptime(p[4].replace("due ","").replace("sent ",""), "%Y-%m-%d")
    except:
        return datetime.max

projects.sort(key=sort_key)

for p in projects:
    print(f"| {p[0]} | {p[1]} | {p[2]} | {p[3]} | {p[4]} |")
EOF >> "$OUTPUT_FILE"

echo "" >> "$OUTPUT_FILE"
echo "_Last updated: $(date +%Y-%m-%d)_" >> "$OUTPUT_FILE"

echo "Exported to $OUTPUT_FILE"