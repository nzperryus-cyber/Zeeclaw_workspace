# Project Tracker Skill

## Purpose
Track all projects with status, revisions, customers, and due dates. Always read from meta.md files directly. Use tracker.py for all writes.

## Architecture

**Source of truth:** `projects/*/meta.md`
**Fast index:** `projects/registry.db` (SQLite)
**Ontology:** Linked for cross-project queries

**Read path:** meta.md → always current
**Write path:** tracker.py → updates meta.md + registry.db + ontology

## Commands

### List all projects
```bash
python3 skills/project-tracker/tracker.py list
```

### Filter by status
```bash
python3 skills/project-tracker/tracker.py list --status quoting
python3 skills/project-tracker/tracker.py list --status sent
```

### Filter by customer
```bash
python3 skills/project-tracker/tracker.py list --customer Ford
python3 skills/project-tracker/tracker.py list --status quoting --customer MBUSI
```

### Single project status
```bash
python3 skills/project-tracker/tracker.py status 25-67725
```

### Project update — NATURAL LANGUAGE
When Nathan gives a project update, use update with natural language:
```bash
python3 skills/project-tracker/tracker.py update "25-67725 rev 2 is quoting due 4/7/26"
python3 skills/project-tracker/tracker.py update "25-72998 is waiting for next round from MBUSI"
python3 skills/project-tracker/tracker.py update "25-72313 rev 1 due ASAP note timing limitation cannot quote current schedule"
```

### Add new project
```bash
python3 skills/project-tracker/tracker.py add 25-73750 --customer "Ford" --description "New cobot cell"
```
This creates the full folder structure: `meetings/`, `quotes/`, `rfq/`, `sows/`

### Sync registry from meta.md files
```bash
python3 skills/project-tracker/tracker.py sync
```
Use after bulk changes or if registry seems out of sync.

### Archive a project
```bash
python3 skills/project-tracker/tracker.py archive 25-73050
```

## How to Handle Project Updates

When Nathan says something like:
- "25-67725 rev 2 is quoting due 4/7/26"
- "25-72998 is waiting for next round"
- "25-72313 rev 1 is quoting due ASAP"

**Always:**
1. Call `tracker.py update "..."` with the exact text Nathan said
2. Read the confirmation output
3. Show Nathan what was updated

**Never:**
- Edit meta.md files manually
- Update the ontology directly
- Use the index.md as the project source

## Meta.md Format

Every project has `projects/XX-XXXXX/meta.md`:
```
# 25-67725 — Ford — Plasma

## Status
- **Status:** Quoting
- **Revision:** Rev 2
- **Due date:** 2026-04-07
- **Customer:** Ford

## Notes
Scope notes here.

## History
- 2026-03-19 — Sent rev 1
- 2026-03-30 — Rev 2 quoting, due 4/7/26
```

## Status Values
Use these exact values: `new`, `quoting`, `sent`, `awarded`, `lost`, `mothballed`, `active`, `completed`, `paused`

## Revision Format
Always `Rev 0`, `Rev 1`, `Rev 2`, etc.

## Example Conversations

**Nathan:** "25-67725 rev 2 is quoting due 4/7/26"
**You:**
```bash
python3 skills/project-tracker/tracker.py update "25-67725 rev 2 is quoting due 4/7/26"
```
Output: "Updated 25-67725: quoting, Rev 2, due 2026-04-07"

**Nathan:** "what quoting projects do I have?"
**You:**
```bash
python3 skills/project-tracker/tracker.py list --status quoting
```

**Nathan:** "show me all MBUSI projects"
**You:**
```bash
python3 skills/project-tracker/tracker.py list --customer MBUSI
```

**Nathan:** "what's the status of 25-72998?"
**You:**
```bash
python3 skills/project-tracker/tracker.py status 25-72998
```

## Red Lines
- Always use `tracker.py update` for project changes — never edit meta.md directly
- Always show Nathan the tracker.py output confirmation
- If tracker.py fails, tell Nathan and suggest manual fix
- Never use the ontology as primary source for project status
- Never update index.md — it is not the source of truth
