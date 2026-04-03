# Maintenance Log

---
## 2026-03-20 — Initial Setup
- Created workspace folder structure: projects/, memory/, notes/, skills/
- Imported Zeeclaw identity and configuration
- Cleaned up 90+ scattered migration memory fragments → consolidated into MEMORY.md
- Set up project tracking with proper format
- Committed all files to git
- Skills: weather updated to US units (°F, mph)

---
## Weekly Maintenance — 2026-03-22 Sun 04:00 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects

**Git uncommitted changes:** yes ⚠️

**Git remote:** No upstream configured ⚠️

**Drive backup:** 1kniCLElzdmAAqwg4lQwTfKAvdLBldu8S  workspace-2026-03-22.tar.gz  file  36.7 KB  2026-03-22 06:00

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  a4c0fca6-1fe3-4259-9017-397ba67a9ace Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... <1m ago    -          running   isolated  main       -
  5d4ab260-012a-46f0-8813-cc33a477cefa Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 60m     -          idle      isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 2h      -          idle      isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 20h     4h ago     ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 22h     2h ago     ok        isolated  main       -
  5240fedf-85ad-45e0-bbd4-6a75f83d3414 Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 1d      -          idle      isolated  main       -
  b3d5e540-705f-417e-8997-7a77eea75fb0 End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 2d      -          idle      isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 5d      -          idle      isolated  main       -

**OpenClaw Warnings:** 2 warning(s)

**Machine load (5m avg):** 0.23
**OpenClaw /tmp size:** 154M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -                             

**Memory logs:** 1 files, 40K

**Skills:**
  - iyeque-pdf-reader
  - knowledge
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - openclaw-update.sh
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-25 Wed 13:01 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/meetings
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/meetings
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/meetings
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Git uncommitted changes:** yes ⚠️

**Drive backup:** 1moqp04PxSD6hC4Rbkap_6Sbit7fYp1Hc  workspace-2026-03-25.tar.gz  file  2.2 MB   2026-03-25 17:01

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  b3d5e540-705f-417e-8997-7a77eea75fb0 End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 5h      19h ago    error     isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 11h     13h ago    ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 13h     11h ago    ok        isolated  main       -
  d5d302a2-7ef1-4213-aa4b-2828a50046bf Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 18h     6h ago     error     isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 2d      -          idle      isolated  main       -
  a4c0fca6-1fe3-4259-9017-397ba67a9ace Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  5d4ab260-012a-46f0-8813-cc33a477cefa Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 4d      -          idle      isolated  main       -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 7d      -          idle      isolated  main       -

**OpenClaw Critical Issues:**
  CRITICAL Telegram group commands have no sender allowlist
  Telegram group access is enabled but no sender allowlist is configured; this allows any group member to invoke /… commands (including skill commands).
  Fix: Approve yourself via pairing (recommended), or set channels.telegram.groupAllowFrom (or per-group groups.<id>.allowFrom).

**OpenClaw Warnings:** 2 warning(s)

**Machine load (5m avg):** 1.39
**OpenClaw /tmp size:** 155M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 2 files, 48K

**Skills:**
  - iyeque-pdf-reader
  - knowledge
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - openclaw-update.sh
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 5 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-25 Wed 13:02 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/meetings
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/meetings
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/meetings
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Git uncommitted changes:** yes ⚠️

**Drive backup:** 1moqp04PxSD6hC4Rbkap_6Sbit7fYp1Hc  workspace-2026-03-25.tar.gz  file  2.2 MB   2026-03-25 17:01

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  b3d5e540-705f-417e-8997-7a77eea75fb0 End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 5h      19h ago    error     isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 11h     13h ago    ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 13h     11h ago    ok        isolated  main       -
  d5d302a2-7ef1-4213-aa4b-2828a50046bf Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 18h     6h ago     error     isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 2d      -          idle      isolated  main       -
  a4c0fca6-1fe3-4259-9017-397ba67a9ace Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  5d4ab260-012a-46f0-8813-cc33a477cefa Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 4d      -          idle      isolated  main       -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 7d      -          idle      isolated  main       -

**OpenClaw Critical Issues:**
  CRITICAL Telegram group commands have no sender allowlist
  Telegram group access is enabled but no sender allowlist is configured; this allows any group member to invoke /… commands (including skill commands).
  Fix: Approve yourself via pairing (recommended), or set channels.telegram.groupAllowFrom (or per-group groups.<id>.allowFrom).

**OpenClaw Warnings:** 2 warning(s)

**Machine load (5m avg):** 1.44
**OpenClaw /tmp size:** 155M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 2 files, 48K

**Skills:**
  - iyeque-pdf-reader
  - knowledge
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - openclaw-update.sh
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 5 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-25 Wed 13:02 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/meetings
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/meetings
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/meetings
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Git uncommitted changes:** yes ⚠️

**Drive backup:** 1moqp04PxSD6hC4Rbkap_6Sbit7fYp1Hc  workspace-2026-03-25.tar.gz  file  2.2 MB   2026-03-25 17:01

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  b3d5e540-705f-417e-8997-7a77eea75fb0 End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 5h      19h ago    error     isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 11h     13h ago    ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 13h     11h ago    ok        isolated  main       -
  d5d302a2-7ef1-4213-aa4b-2828a50046bf Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 18h     6h ago     error     isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 2d      -          idle      isolated  main       -
  a4c0fca6-1fe3-4259-9017-397ba67a9ace Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  5d4ab260-012a-46f0-8813-cc33a477cefa Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 4d      3d ago     error     isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 4d      -          idle      isolated  main       -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 7d      -          idle      isolated  main       -

**OpenClaw Critical Issues:**
  CRITICAL Telegram group commands have no sender allowlist
  Telegram group access is enabled but no sender allowlist is configured; this allows any group member to invoke /… commands (including skill commands).
  Fix: Approve yourself via pairing (recommended), or set channels.telegram.groupAllowFrom (or per-group groups.<id>.allowFrom).

**OpenClaw Warnings:** 2 warning(s)

**Machine load (5m avg):** 1.44
**OpenClaw /tmp size:** 155M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 2 files, 48K

**Skills:**
  - iyeque-pdf-reader
  - knowledge
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - openclaw-update.sh
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 5 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-26 Thu 07:36 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/meetings
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/meetings
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/meetings
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Git uncommitted changes:** yes ⚠️

**Drive backup:** 1aqALyzzp_tHSocguKXOjNO495Jp6WOJU  workspace-2026-03-26.tar.gz  file  2.2 MB   2026-03-26 06:01

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model

**OpenClaw Critical Issues:**
  CRITICAL Telegram group commands have no sender allowlist
  Telegram group access is enabled but no sender allowlist is configured; this allows any group member to invoke /… commands (including skill commands).
  Fix: Approve yourself via pairing (recommended), or set channels.telegram.groupAllowFrom (or per-group groups.<id>.allowFrom).

**OpenClaw Warnings:** 3 warning(s)

**Machine load (5m avg):** 1.15
**OpenClaw /tmp size:** 664K
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -                            

**Memory logs:** 2 files, 44K

**Skills:**
  - iyeque-pdf-reader
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - openclaw-update.sh
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 5 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-28 Sat 13:00 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  Last success: Sat Mar 28 09:40:09 AM EDT 2026: Backup complete
  Sat Mar 28
  Last failure: Fri Mar 27

**Cron jobs:**

**Machine load (5m avg):** 0.32
**OpenClaw /tmp size:** 2.1M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -                             

**Memory logs:** 3 files, 56K

**Skills:**
  - end-of-day.sh
  - export-projects.py
  - export-projects.sh
  - iyeque-pdf-reader
  - morning-briefing.sh
  - nightly-commit.log
  - nightly-commit.sh
  - ontology
  - ontology-sync.sh
  - openclaw-update.sh
  - reminder
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-29 Sun 04:02 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/skills/mlb-daily-scores/.venv/include
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  Last success: Sun Mar 29 02:30:54 AM EDT 2026: Backup complete
  Sun Mar 29
  Last failure: Fri Mar 27

**Cron jobs:**
  [plugins] [lcm] Plugin loaded (enabled=true, db=/home/nathan/.openclaw/lcm.db, threshold=0.75)
  [plugins] [lcm] Compaction summarization model: ollama/phi4-mini:latest (override)
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  bd8f03a6-7bb9-4b00-9ed2-3f027e1c5acd Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... 2m ago     -          running   isolated  -          -
  6bc9cf8e-69d1-4b8e-bba9-8e9bad998b74 Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 58m     -          idle      isolated  -          -
  9123877a-e95e-4012-b42e-2efe6eeab298 MLB Daily Scores — At... cron 0 6 * * * @ America/New_... in 2h      -          idle      isolated  -          -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 20h     4h ago     ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 22h     2h ago     ok        isolated  main       -
  6c4a59b5-ebe3-4a50-8814-57dae3094027 Daily Ontology Sync      cron 0 6 * * 1-5 @ America/Ne... in 1d      -          idle      isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 1d      -          idle      isolated  main       -
  75639c74-0944-4d56-8493-ed750e9b6064 Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 1d      2d ago     ok        isolated  -          -
  146140da-4e45-452f-be87-f9236951bf9a End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 2d      1d ago     error     isolated  -          -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 3d      -          idle      isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 5d      2d ago     error     isolated  main       -

**OpenClaw Warnings:** 4 warning(s)

**Machine load (5m avg):** 0.33
**OpenClaw /tmp size:** 564K
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 3 files, 56K

**Skills:**
  - end-of-day.sh
  - export-projects.py
  - export-projects.sh
  - iyeque-pdf-reader
  - mlb-daily-scores
  - morning-briefing.sh
  - nightly-commit.log
  - nightly-commit.sh
  - ontology
  - ontology-sync.sh
  - openclaw-update.sh
  - reminder
  - remindme
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-03-29 Sun 04:02 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/skills/mlb-daily-scores/.venv/include
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  Last success: Sun Mar 29 02:30:54 AM EDT 2026: Backup complete
  Sun Mar 29
  Last failure: Fri Mar 27

**Cron jobs:**
  [plugins] [lcm] Plugin loaded (enabled=true, db=/home/nathan/.openclaw/lcm.db, threshold=0.75)
  [plugins] [lcm] Compaction summarization model: ollama/phi4-mini:latest (override)
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  bd8f03a6-7bb9-4b00-9ed2-3f027e1c5acd Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... 3m ago     -          running   isolated  -          -
  6bc9cf8e-69d1-4b8e-bba9-8e9bad998b74 Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 57m     -          idle      isolated  -          -
  9123877a-e95e-4012-b42e-2efe6eeab298 MLB Daily Scores — At... cron 0 6 * * * @ America/New_... in 2h      -          idle      isolated  -          -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 20h     4h ago     ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 22h     2h ago     ok        isolated  main       -
  6c4a59b5-ebe3-4a50-8814-57dae3094027 Daily Ontology Sync      cron 0 6 * * 1-5 @ America/Ne... in 1d      -          idle      isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 1d      -          idle      isolated  main       -
  75639c74-0944-4d56-8493-ed750e9b6064 Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 1d      2d ago     ok        isolated  -          -
  146140da-4e45-452f-be87-f9236951bf9a End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 2d      1d ago     error     isolated  -          -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 3d      -          idle      isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 5d      2d ago     error     isolated  main       -

**OpenClaw Warnings:** 4 warning(s)

**Machine load (5m avg):** 0.47
**OpenClaw /tmp size:** 576K
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 3 files, 56K

**Skills:**
  - end-of-day.sh
  - export-projects.py
  - export-projects.sh
  - iyeque-pdf-reader
  - mlb-daily-scores
  - morning-briefing.sh
  - nightly-commit.log
  - nightly-commit.sh
  - ontology
  - ontology-sync.sh
  - openclaw-update.sh
  - reminder
  - remindme
  - skill-vetter
  - weekly-maintenance.sh
  - workspace-backup.sh
  [system skills]
  - pdf-extract
  - rfq-analyzer
  - self-improving-agent
  - skills
  - sow
  - summarize
  - weekly-evolver.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-04-01 Wed 11:44 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  **No successful backup found** ⚠️

**Cron jobs:**
  Config was last written by a newer OpenClaw (2026.3.31); current version is 2026.3.28.
  Config was last written by a newer OpenClaw (2026.3.31); current version is 2026.3.28.
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  146140da-4e45-452f-be87-f9236951bf9a End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 6h      49m ago    ok        isolated  main       -
  a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d Nightly LLM Ontology ... cron 0 23 * * 1-5 @ America/N... in 11h     50m ago    ok        isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 12h     50m ago    ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 14h     50m ago    ok        isolated  main       -
  6c4a59b5-ebe3-4a50-8814-57dae3094027 Daily Ontology Sync      cron 0 6 * * 1-5 @ America/Ne... in 18h     50m ago    ok        isolated  main       -
  9123877a-e95e-4012-b42e-2efe6eeab298 MLB Daily Scores — At... cron 0 6 * * * @ America/New_... in 18h     42m ago    ok        isolated  main       -
  df4cb9e9-cd75-4a3b-b68f-db1b6378659d Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 19h     7m ago     ok        isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 2d      4h ago     ok        isolated  main       -
  bd8f03a6-7bb9-4b00-9ed2-3f027e1c5acd Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 4d      4h ago     running   isolated  main       -
  6bc9cf8e-69d1-4b8e-bba9-8e9bad998b74 Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 4d      4h ago     ok        isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 4d      4h ago     ok        isolated  main       -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 91d     3h ago     ok        isolated  main       -

**OpenClaw Warnings:** 3 warning(s)

**Machine load (5m avg):** 1.32
**OpenClaw /tmp size:** 1.2M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 5 files, 148K

**Skills:**
  - export-projects.py
  - export-projects.sh
  - nightly-commit.log
  [system skills]
  - backup.sh
  - end-of-day.sh
  - iyeque-pdf-reader
  - mlb-daily-scores
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - ontology-sync-meta.sh
  - ontology-sync.sh
  - openclaw-update.sh
  - pdf-extract
  - projects-index.sh
  - project-tracker
  - reminder
  - rfq-analyzer
  - self-improvement
  - self-improving-agent
  - skill-vetter
  - sow
  - summarize
  - weekly-evolver.sh
  - weekly-maintenance.sh
  - workspace-backup.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-04-01 Wed 11:46 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  **No successful backup found** ⚠️

**Cron jobs:**
  Config was last written by a newer OpenClaw (2026.3.31); current version is 2026.3.28.
  Config was last written by a newer OpenClaw (2026.3.31); current version is 2026.3.28.
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  146140da-4e45-452f-be87-f9236951bf9a End-of-Day Project Su... cron 0 18 * * 1-5 @ America/N... in 6h      51m ago    ok        isolated  main       -
  a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d Nightly LLM Ontology ... cron 0 23 * * 1-5 @ America/N... in 11h     51m ago    ok        isolated  main       -
  8f47df53-7678-4978-beec-6a4debf356ed Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 12h     51m ago    ok        isolated  main       -
  14daa12c-a51f-467b-a635-3000dfc6cfa5 Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 14h     52m ago    ok        isolated  main       -
  6c4a59b5-ebe3-4a50-8814-57dae3094027 Daily Ontology Sync      cron 0 6 * * 1-5 @ America/Ne... in 18h     51m ago    ok        isolated  main       -
  9123877a-e95e-4012-b42e-2efe6eeab298 MLB Daily Scores — At... cron 0 6 * * * @ America/New_... in 18h     44m ago    ok        isolated  main       -
  df4cb9e9-cd75-4a3b-b68f-db1b6378659d Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 19h     8m ago     ok        isolated  main       -
  77286df8-4920-4f2e-8380-d6c088b3a932 Weekly Review            cron 0 16 * * 5 @ America/New... in 2d      4h ago     ok        isolated  main       -
  bd8f03a6-7bb9-4b00-9ed2-3f027e1c5acd Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 4d      1m ago     running   isolated  main       -
  6bc9cf8e-69d1-4b8e-bba9-8e9bad998b74 Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 4d      4h ago     ok        isolated  main       -
  3c6be373-995a-4255-a4f9-08d6a5bbfa1b Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 4d      4h ago     ok        isolated  main       -
  9fee9e2e-2144-424a-b3f1-1be3d7858ca4 quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 91d     3h ago     ok        isolated  main       -

**OpenClaw Warnings:** 3 warning(s)

**Machine load (5m avg):** 1.42
**OpenClaw /tmp size:** 1.2M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -  

**Memory logs:** 5 files, 148K

**Skills:**
  - export-projects.py
  - export-projects.sh
  - nightly-commit.log
  [system skills]
  - backup.sh
  - end-of-day.sh
  - iyeque-pdf-reader
  - mlb-daily-scores
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - ontology-sync-meta.sh
  - ontology-sync.sh
  - openclaw-update.sh
  - pdf-extract
  - projects-index.sh
  - project-tracker
  - reminder
  - rfq-analyzer
  - self-improvement
  - self-improving-agent
  - skill-vetter
  - sow
  - summarize
  - weekly-evolver.sh
  - weekly-maintenance.sh
  - workspace-backup.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️

---
## Weekly Maintenance — 2026-04-03 Fri 09:05 EDT

**Empty directories:**
  - /home/nathan/.openclaw/workspace/documents/pdfs
  - /home/nathan/.openclaw/workspace/projects/26-73415/quotes
  - /home/nathan/.openclaw/workspace/projects/26-73415/meetings
  - /home/nathan/.openclaw/workspace/projects/26-73415/sows
  - /home/nathan/.openclaw/workspace/projects/25-67725/rfq
  - /home/nathan/.openclaw/workspace/projects/25-67725/quotes
  - /home/nathan/.openclaw/workspace/projects/25-67725/sows
  - /home/nathan/.openclaw/workspace/projects/25-71662/rfq
  - /home/nathan/.openclaw/workspace/projects/25-71662/quotes
  - /home/nathan/.openclaw/workspace/projects/25-71662/sows
  - /home/nathan/.openclaw/workspace/projects/25-73403/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73403/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73403/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73403/sows
  - /home/nathan/.openclaw/workspace/projects/25-72998/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72998/sows
  - /home/nathan/.openclaw/workspace/projects/25-73287/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/rfq
  - /home/nathan/.openclaw/workspace/projects/25-73050/quotes
  - /home/nathan/.openclaw/workspace/projects/25-73050/meetings
  - /home/nathan/.openclaw/workspace/projects/25-73050/sows
  - /home/nathan/.openclaw/workspace/projects/25-72313/rfq
  - /home/nathan/.openclaw/workspace/projects/25-72313/quotes
  - /home/nathan/.openclaw/workspace/projects/25-72313/sows

**Large files (>10MB):**
  - /home/nathan/.openclaw/workspace/oem-standards/mercedes/000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf (13M)
  - /home/nathan/.openclaw/workspace/.git/objects/58/d2cac89f1f3fa3abb0ad5954e1e82a70ea7c97 (11M)

**Git uncommitted changes:** yes ⚠️

**Drive backup:**
  **No successful backup found** ⚠️

**Cron jobs:**
  ID                                   Name                     Schedule                         Next       Last       Status    Target    Agent ID   Model
  6e81f7ec-65a3-4c3b-87b7-dc204b74ea69 Generate RECENT-HEADE... cron 0 10 * * * @ America/New... in 54m     23h ago    ok        isolated  -          -
  1a4e5542-c1e4-44b7-8dc8-1b0ddc96c7b4 Memory Log — 12pm ET     cron 0 12 * * * @ America/New... in 3h      -          idle      main      -          -
  f3425e56-8bb6-4a24-8281-b939114ac469 Memory Log — 9am ET      cron 0 14 * * 1-5 @ America/N... in 5h      15h ago    ok        main      -          -
  dbd65bd2-835b-430b-9eb0-a942cfb35f8e Weekly Review            cron 0 16 * * 5 @ America/New... in 7h      2m ago     ok        isolated  -          -
  606c7397-686c-4248-87d0-d02869538fa1 Memory Log — 3pm ET      cron 0 20 * * 1-5 @ America/N... in 11h     13h ago    ok        main      -          -
  1a9f1693-abb4-49a1-8b0f-1f57e2a08b5f Memory Log — 6pm ET      cron 0 23 * * 1-5 @ America/N... in 14h     10h ago    ok        main      -          -
  9ee1cb19-479f-4cbb-af04-bfaf6d810312 Nightly LLM Ontology ... cron 0 23 * * 1-5 @ America/N... in 14h     10h ago    ok        main      -          -
  99cc72c1-b866-4f9b-9d93-86770cbb592f Nightly Git Auto-Commit  cron 0 0 * * * @ America/New_... in 15h     9h ago     ok        isolated  -          -
  b21b8a4e-c3ec-4509-b31f-5f4e002b5544 Memory Log — Nightly ... cron 0 0 * * * @ America/New_... in 15h     9h ago     ok        main      -          -
  348efcd1-0f4a-41c6-ad9e-fe68411812cc Nightly Workspace Bac... cron 0 2 * * * @ America/New_... in 17h     33m ago    ok        isolated  -          -
  48dd0031-ce6b-48a6-b7c4-1a3e9dac8b07 MLB Daily Scores — At... cron 0 6 * * * @ America/New_... in 21h     5m ago     ok        isolated  -          -
  fc4aeafe-ed85-4fc7-9402-bf1c4de9f25b Weekly Workspace Main... cron 0 4 * * 0 @ America/New_... in 2d      -          running   isolated  -          -
  7db2a7a0-3d67-4d60-96f3-5e861bd2e462 Weekly Evolver           cron 0 5 * * 0 @ America/New_... in 2d      -          idle      isolated  -          -
  15929d03-6985-4ccb-9ff7-05029bfb1469 Weekly OpenClaw Self-... cron 0 6 * * 0 @ America/New_... in 2d      -          idle      isolated  -          -
  22c18c97-ce14-4ec3-84fe-12bc2ea079dd Daily Ontology Sync      cron 0 6 * * 1-5 @ America/Ne... in 3d      1h ago     ok        isolated  -          -
  00bdeade-b5a0-4008-9265-55ebb1b0c6ab Weekday Morning Briefing cron 0 7 * * 1-5 @ America/Ne... in 3d      31m ago    ok        isolated  -          -
  fbc0a667-f7d2-45ce-9c9c-0747fd5c1d5c Weekly Update Check      cron 0 8 * * 1 @ America/New_... in 3d      -          idle      isolated  -          -
  1cc7dd92-0eca-49c5-b623-cb251a49142c quarterly-setup-review   cron 0 9 1 1,4,7,10 * @ Ameri... in 89d     -          idle      isolated  -          -

**OpenClaw Warnings:** 6 warning(s)

**Machine load (5m avg):** 0.99
**OpenClaw /tmp size:** 7.4M
**Tailscale:** 100.89.93.42    nathan-macbookpro  nzperryus@  linux  -                               

**Memory logs:** 8 files, 232K

**Skills:**
  - evolver
  - export-projects.py
  - export-projects.sh
  - feishu-evolver-wrapper
  - lossless-claw
  - nightly-commit.log
  [system skills]
  - backup.sh
  - cron-error-monitor.sh
  - end-of-day.sh
  - iyeque-pdf-reader
  - memory-log
  - mlb-daily-scores
  - morning-briefing.sh
  - nightly-commit.sh
  - ontology
  - ontology-sync-meta.sh
  - ontology-sync.sh
  - openclaw-update.sh
  - pdf-extract
  - projects-index.sh
  - project-tracker
  - reminder
  - rfq-analyzer
  - secret-checker.sh
  - self-improvement
  - self-improving-agent
  - skill-vetter
  - sow
  - summarize
  - update-check.sh
  - weekly-evolver.sh
  - weekly-maintenance.sh
  - workspace-backup.sh

**RFQ shared_folder check:**
  ✓ 25-67725 - Ford Plasma Cells: 5 file(s)
  ✓ 25-72998 - MBUSI Gluing Cell: 6 file(s)
  ✓ 25-72313 - Ford FRAP Mega Cell: 1 file(s)
  ✓ 25-71662 - Ford Cobot Projects: 8 file(s)
  ✓ 24-68775 - Metalsa Frame Wax: 1 file(s)

**Status:** 1 issue(s) found ⚠️
