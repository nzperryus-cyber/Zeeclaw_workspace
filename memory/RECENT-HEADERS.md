# Recent Session Headers

*Auto-generated 2026-04-03 10:02 — last 14 days*

## 2026-04-03

**Overview:** Systematic file-by-file review of LCM source code and configuration.

**Decisions:**
  • Continue with systematic OpenClaw cleanup session as per user's request.

**Corrections:**
  • None specified for Nathan's corrections within these specific interactions; however, general guidance was provided on how to proceed with OpenClaw cleanup based on earlier discussions.

**Open:**
  • Continue reviewing remaining LCM source files.
  • Move onto review of the core OpenClaw codebase from downloads folder not yet covered in this session (Exchange 12).


## 2026-04-02

**Overview:** Continued systematic file-by-file review of LCM source code.

**Decisions:**
  • Continue reviewing remaining OpenClaw core files from downloads folder as per user's request.

**Corrections:**
  • FIX: OLLAMA API KEY IN MODELS.JSON TO USE SECRETREF FORMAT
  • REMOVE: FAKE CLOUD MODELS AND DEAD DUPLICATE MINIMAX-PORTAL


## 2026-04-01

**Overview:** Nathan worked on resolving OpenClaw cron issues after an update.

**Decisions:**
  • Upgraded to openclaw version 2026.4.1 based on user's suggestion and existing bug reports.

**Failures:**
  • Cron jobs timing out before completion (Issue with crons still being a problem even though they were supposed to be fixed this morning).

**Corrections:**
  • Nathan removed the "wakeMode: 'now'" setting which was causing rogue triggers.
  • Increased timeout settings for cron scripts after identifying them as too short.

**DNA Patterns:**
  • SLOPPY_VERIFICATION - CRON TIMEOUTS
  • MISSING_CONTEXT - OPENCLAW TOKEN USAGE INQUIRY

**Open:**
  • Further investigation needed into why 12.2M tokens are being used on OpenClaw today, possibly related to a different counter or LCM storage issues (as per Nathan's later message).
