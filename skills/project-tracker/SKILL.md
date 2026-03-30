# Project Tracker Skill

## Purpose
Automatically capture and persist project updates from natural conversation. When Nathan tells you about a project change — status, revision, due date, customer, notes — write it to the project's `meta.md` file immediately.

## How It Works
When you detect a project update in conversation, call the tracker script:
```bash
python3 skills/project-tracker/tracker.py update "25-67725 rev 2 is quoting due 4/7/26"
```

The script parses the input, updates the project's `meta.md`, and syncs to the ontology.

## Meta.md Format — Source of Truth
```
# [project-id] — [customer] — [description]

## Status
- **Status:** [status]
- **Revision:** [rev]
- **Due date:** [date]
- **Customer:** [customer]

## Notes

## History
- [date] — [note]
```

## Status Values
Use lowercase: `quoting`, `sent`, `awarded`, `lost`, `mothballed`, `active`, `completed`, `paused`, `new`

## Revision Format
`Rev 0`, `Rev 1`, `Rev 2`, etc.

## Patterns to Detect
- "25-72998 rev 1 is sent" → status=sent, rev=Rev 1
- "25-67725 rev 2 is quoting stage due 4/7/26" → status=quoting, rev=Rev 2, due=2026-04-07
- "25-72313 due ASAP timing limitation" → status=quoting, due=ASAP, notes=timing limitation
- "25-73050 is mothballed" → status=mothballed
- "25-73287 is new MBUSI cavity wax robot" → status=new, customer=MBUSI

## Workflow
1. **Detect** project update in message
2. **Parse** project ID, status, rev, due date, notes
3. **Write** to `projects/[id]/meta.md` immediately
4. **Verify** write succeeded before confirming to Nathan
5. **Background sync** to ontology (handled by the script)

## Projects Directory
`/home/nathan/.openclaw/workspace/projects/`

## Index File
Update `projects/index.md` if the project list changes (new project added, project removed).

## Red Lines
- Never claim an update was made if the write failed — tell Nathan it failed and what to do
- Never use the ontology as the primary source for project status — always read from meta.md
- Always confirm what you updated: "Updated 25-67725: rev 2, quoting, due 4/7"

## Examples

### Example: Full status update
Nathan: "25-67725 rev 2 is quoting stage due 4/7/26"
You call: `tracker.py update "25-67725 rev 2 is quoting due 2026-04-07"`
You say: "Done. Updated 25-67725: rev 2, quoting, due 4/7/26."

### Example: Status only
Nathan: "25-72998 is waiting for next round from MBUSI"
You call: `tracker.py update "25-72998 status sent note waiting for next round"`
You say: "Done. Updated 25-72998: waiting for next round from MBUSI."

### Example: No project found
Nathan: "we have a new project with Ford for a plasma table"
You say: "What's the project number? I need that to create the meta.md entry."
