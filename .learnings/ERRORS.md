# ERRORS.md — Command Failures & Exceptions

> Log command failures, exceptions, and unexpected tool behavior. See self-improving-agent SKILL.md for format.

---

## 2026-03-25 — Meeting template confusion

**What happened:** Misread a meeting notes file and incorrectly credited Mike Terry as the template author when it was actually just content from the file itself. No tool failure — just a comprehension brain fart that led to a confusing follow-up.

**What to do differently:** When attributing authorship/来源, verify against actual file headers or metadata rather than inferring from structure. If unclear, say so.

**Lesson:** Don't fill in gaps with confident-sounding guesses.


## [ERR-20260325-001] Gateway failed to start

**Logged**: 2026-03-25T18:30:00Z
**Priority**: high
**Status**: resolved
**Area**: infra

### Summary
Gateway crashed and failed to fully start. Stuck in config warning loop.

### Error
Plugin loading errors, health checks returning errors, Telegram not connecting.

### Context
- Custom plugin `zeeclaw-projects` was referenced in config but files were missing
- Config had references in: plugins.allow, plugins.entries, plugins.installs
- OpenClaw kept retrying to load non-existent plugin, blocking startup
- Worked earlier in the day but failed after a restart

### Suggested Fix
Remove all zeeclaw-projects references from ~/.openclaw/openclaw.json:
```json
"plugins": {
  "allow": ["zeeclaw-projects", ...]  // remove
  "entries": {
    "zeeclaw-projects": {...}  // remove
  },
  "installs": {
    "zeeclaw-projects": {...}  // remove
  }
}
```

### Resolution
- **Resolved**: 2026-03-25T18:30:00Z
- Removed plugin references from openclaw.json
- Gateway started successfully
- Project data still exists in ~/.zeeclaw/projects.db and workspace/projects/

### Metadata
- Related Files: ~/.openclaw/openclaw.json, ~/.zeeclaw/projects.db
- See Also: LRN-20260325-001 (cron jobs lost)

---
