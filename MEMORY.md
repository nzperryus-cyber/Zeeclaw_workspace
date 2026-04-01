# MEMORY.md — Zeeclaw's Long-Term Memory

_Curated facts about Nathan, his family, work, and preferences. Updated regularly._

---

## About Nathan

- Senior automation controls/application engineer at JR Automation
- Previously a controls engineer — left because the travel was too much to have a family
- Works on automotive OEM automation: Ford (VOSS standards), GM GCCH, BMW TMO, Mercedes/MBUSI, Stellantis
- **Coffee:** life juice
- **Food:** burgers and hot dogs (lettuce, tomato, onion, ketchup, mustard)
- **Tone preference:** direct
- Hates corporate bullshit, vendor lock-in, Meta/Facebook products, Elon Musk companies
- Enjoys golf recreationally

---

## Family

### Amy (wife)
- Former nurse, now stay-at-home
- Birthday: March 5
- Recovering from COVID (March 2026)
- Enjoys pickleball and volleyball
- Sometimes does "free betting"

### Zander (son)
- Age: 7
- 2nd grade
- Into dragons and books

### Zella (daughter)
- Age: 18
- Freshman at Guilford College
- Works at a toy store
- Lives at home

### Stan (dog)
- 3 years old
- Born on Halloween

---

## Preferences & Notes

- **Project list:** stored in `projects/index.md` — always use this format when listing: `• [Project #] — [Customer] — [Description] — [Status with rev #] — [due date OR sent date]`
- **Weather:** always use `&u` for US units (°F, mph)
- **Key client:** Ford (VOSS standards)

---

## Recent Events

- Family trip to St. Augustine, FL: 3/12–3/15/2025 (spring break with Amy and Zella)
- Amy and Zander in Myrtle Beach (weekend of 3/28/26 — Boardwalk Billy's for dinner)
- Amy recovering from COVID (March 2026)
- Amy recovering from COVID (March 2026)
- Stan is Nathan's dog, 3 years old, born Halloween

## System & Architecture (2026-03)

### Memory System — Full Architecture
Nathan's memory system has three layers:
1. **LCM** (Lossless Context Management) — permanent conversation history via lossless-claw plugin + phi4-mini local model. Never loses context, summarization is free (local).
2. **Ontology** — structured knowledge graph at `memory/ontology/graph.jsonl`. Query with `ontology.py`. Updated via: (a) morning meta.md sync, (b) nightly 11pm LLM sync from session transcripts.
3. **MEMORY.md + daily logs** — curated long-term memory + raw daily session logs.

### Skills Installed
- **mlb-daily-scores**: Atlanta Braves daily scores, 6am ET → Telegram
- **remindme v2.0.2**: installed 2026-03-28
- **self-improving-agent**: installed earlier, hook enabled

### OpenClaw Cron Jobs (12 total)
- 5 healthy (nightly git, nightly backup, MLB scores, Nightly LLM sync, quarterly review)
- 7 erroring (pre-restart timeout issues — gateway restarted 2026-03-30, timeouts increased)

### Ontology / Project Tracking
Projects tracked in ontology via `projects/*/meta.md`. Always update ontology when Nathan says "remember that..." about a project. Morning briefing syncs meta.md → ontology automatically.
