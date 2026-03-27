#!/usr/bin/env python3
import json
from datetime import datetime

GRAPH_FILE = "/home/nathan/.openclaw/workspace/memory/ontology/graph.jsonl"
OUTPUT_FILE = "/home/nathan/.openclaw/workspace/projects/index.md"

projects = {}
with open(GRAPH_FILE) as f:
    for line in f:
        data = json.loads(line)
        if data.get("entity", {}).get("type") == "Project":
            p = data["entity"]["properties"]
            proj_id = p.get("project_id", "")
            if proj_id:
                # Keep one with more fields filled in
                if proj_id not in projects:
                    projects[proj_id] = p
                else:
                    # Prefer one with 'due' field
                    if p.get("due") and not projects[proj_id].get("due"):
                        projects[proj_id] = p

# Convert to list and sort
project_list = []
for proj_id, p in projects.items():
    customer = p.get("customer", "")
    desc = p.get("name", "")
    status = p.get("status", "")
    rev = p.get("rev", "")
    due = p.get("due", p.get("sent_date", ""))
    due_date = f"due {due}" if p.get("due") else f"sent {due}" if p.get("sent_date") else ""
    status_rev = f"{status} rev {rev}" if rev else status
    project_list.append((proj_id, customer, desc, status_rev, due_date))

# Sort by due date
def sort_key(p):
    try:
        date_str = p[4].replace("due ", "").replace("sent ", "")
        return datetime.strptime(date_str, "%Y-%m-%d")
    except:
        return datetime.max

project_list.sort(key=sort_key)

with open(OUTPUT_FILE, "w") as f:
    f.write("# Projects Index\n\n")
    f.write("| Project # | Customer | Description | Status with rev # | Due/Sent Date |\n")
    f.write("|-----------|----------|-------------|-------------------|---------------|\n")
    for p in project_list:
        f.write(f"| {p[0]} | {p[1]} | {p[2]} | {p[3]} | {p[4]} |\n")
    f.write(f"\n_Last updated: {datetime.now().strftime('%Y-%m-%d')}_\n")

print(f"Exported {len(project_list)} projects to {OUTPUT_FILE}")