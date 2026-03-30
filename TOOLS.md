# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

## Ontology — Project & Knowledge Graph

The ontology (`memory/ontology/graph.jsonl`) is the structured query layer for projects, people, customers, and relationships. Use it when Nathan asks about project status, deadlines, or details.

**Location:** `skills/ontology/scripts/ontology.py`
**Graph:** `memory/ontology/graph.jsonl`

### Essential Commands

```bash
# List all projects
python3 skills/ontology/scripts/ontology.py list --type Project

# Get a specific project
python3 skills/ontology/scripts/ontology.py get --id proj_25_XXXXX

# Query projects by status
python3 skills/ontology/scripts/ontology.py query --type Project --where '{"status":"quoting"}'
python3 skills/ontology/scripts/ontology.py query --type Project --where '{"status":"sent"}'

# List all people
python3 skills/ontology/scripts/ontology.py list --type Person

# Update a project (e.g., after Nathan says "remember project X is now quoting")
python3 skills/ontology/scripts/ontology.py update --id proj_25_XXXXX --props '{"status":"sent","due":"2026-04-15"}'

# Link entities (e.g., Ford owns this project)
python3 skills/ontology/scripts/ontology.py relate --from ford --rel related_to --to proj_25_72313

# Validate the graph
python3 skills/ontology/scripts/ontology.py validate
```

### Project ID Format

Projects use IDs like `proj_25_73050` (not `25-73050`). When in doubt:
```
python3 skills/ontology/scripts/ontology.py list --type Project
```
Then use the exact ID shown.

### When to Use

- Nathan asks "what's the status of project 25-73050?"
- Nathan says "remember that 25-72998 was sent"
- Nathan asks "which projects are with Ford?"
- Nathan asks "who is the contact for MBUSI?"

---

## OEM Standards

Mercedes standards stored locally for quick reference:
- `/home/nathan/.openclaw/workspace/oem-standards/mercedes/`
- See README.md for file list and quick reference

---

Add whatever helps you do your job. This is your cheat sheet.
