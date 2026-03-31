# Learnings

Corrections, insights, and knowledge gaps captured during development.

**Categories**: correction | insight | knowledge_gap | best_practice
**Areas**: frontend | backend | infra | tests | docs | config
**Statuses**: pending | in_progress | resolved | wont_fix | promoted | promoted_to_skill

## Status Definitions

| Status | Meaning |
|--------|---------|
| `pending` | Not yet addressed |
| `in_progress` | Actively being worked on |
| `resolved` | Issue fixed or knowledge integrated |
| `wont_fix` | Decided not to address (reason in Resolution) |
| `promoted` | Elevated to CLAUDE.md, AGENTS.md, or copilot-instructions.md |
| `promoted_to_skill` | Extracted as a reusable skill |

## Skill Extraction Fields

When a learning is promoted to a skill, add these fields:

```markdown
**Status**: promoted_to_skill
**Skill-Path**: skills/skill-name
```

Example:
```markdown
## [LRN-20250115-001] best_practice

**Logged**: 2025-01-15T10:00:00Z
**Priority**: high
**Status**: promoted_to_skill
**Skill-Path**: skills/docker-m1-fixes
**Area**: infra

### Summary
Docker build fails on Apple Silicon due to platform mismatch
...
```

---


## [LRN-TEST-001] insight

**Logged**: 2026-03-20T10:00:00Z
**Priority**: medium
**Status**: pending
**Area**: config

### Summary
Nathan prefers concise responses without summaries at the end

## [LRN-20260325-001] Gateway crash lost all cron jobs

**Logged**: 2026-03-25T18:35:00Z
**Priority**: high
**Status**: resolved
**Area**: infra

### Summary
When gateway crashed due to broken plugin, the cron jobs system lost all jobs. Had to re-add 6 jobs.

### Details
After fixing the gateway crash, `openclaw cron list` showed only 5 jobs (missing: Morning Briefing, End-of-Day, Weekly Evolver, Weekly Maintenance). The jobs.json had been reset or corrupted.

**Restored jobs:**
- Nightly Git Auto-Commit (0 0 * * *)
- Nightly Workspace Backup (0 2 * * *)
- Weekday Morning Briefing (0 7 * * 1-5) — had to simplify message and increase timeout to 240s
- Weekly Review (0 16 * * 5)
- Weekly OpenClaw Update (0 6 * * 0)
- Quarterly Setup Review (0 9 1 1,4,7,10 *)

**Re-added:**
- End-of-Day Project Summary (0 18 * * 1-5)
- Weekly Evolver (0 5 * * 0)
- Weekly Workspace Maintenance (0 4 * * 0)

### Suggested Action
1. Document cron jobs in workspace/docs/CRON_JOBS.md
2. Consider adding cron job backup/restore mechanism
3. Investigate why jobs.json was wiped (plugin loading crash side effect?)

### Metadata
- Source: error_recovery
- Related Files: ~/.openclaw/cron/jobs.json, docs/CRON_JOBS.md

---

## [LRN-20260325-002] Morning Briefing cron timeout issues

**Logged**: 2026-03-25T07:40:00Z
**Priority**: medium
**Status**: resolved
**Area**: config

### Summary
Morning Briefing cron job kept timing out. Tried increasing timeout from 120s to 180s but still failed at exactly the timeout limit. Simplified the job to fix.

### Details
- Job used project_list tool which adds agent overhead
- Direct DB query via sqlite3 is much faster
- Changed from 120s → 180s → finally 240s
- Simplified instructions to query DB directly instead of using project_list

### Resolution
- Simplified cron job message to use direct sqlite3 query
- Increased timeout to 240s
- Works now

### Metadata
- Source: error
- See Also: LRN-20260325-001 (related to cron job recovery)

---

### LRN-20260330-001
**Pattern:** Stating confidence without verification
**Problem:** Said "project tracking is solid" twice, both times it was a mess. Said "crons are fixed" when they weren't. Gateway timing out for 5 minutes while I didn't respond.
**Why:** I state what I expect to be true instead of verifying actual state. Falls into "mental notes" instead of checking.
**Fix:** Before declaring anything solid, run the actual check and show output. Verify then state. Never state then verify.
**Actions:**
- After project update: run `tracker.py list` and surface result
- Before declaring crons/gateway healthy: verify with `openclaw gateway status` and `openclaw health`
- Don't assume — check
**Source:** Nathan calling out repeated failures to follow own rules

### LRN-20260330-002
**Pattern:** Not reviewing learnings during session startup
**Problem:** AGENTS.md already says "Check .learnings/ERRORS.md and .learnings/LEARNINGS.md" but I wasn't doing it. Made same mistakes twice.
**Why:** Skipped the step, forgot it existed, was focused on conversation not review.
**Fix:** Add learnings review to session startup. Actually follow AGENTS.md step 5 and 6.
**Actions:**
- Check .learnings/ERRORS.md for errors since last session
- Check .learnings/LEARNINGS.md for new corrections
- Actually integrate lessons before starting work
**Source:** Nathan pointing out I ignore my own rules
