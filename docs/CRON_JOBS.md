# Cron Jobs

Active scheduled jobs for OpenClaw.

## Current Jobs

| Job | Schedule | Description |
|-----|----------|-------------|
| Nightly Git Auto-Commit | `0 0 * * *` | Auto-commits workspace changes at midnight |
| Nightly Workspace Backup | `0 2 * * *` | Backs up workspace to Google Drive at 2am |
| Weekday Morning Briefing | `0 7 * * 1-5` | Sends project briefing at 7am weekdays |
| Weekly Review | `0 16 * * 5` | Friday 4pm project pipeline review |
| Weekly OpenClaw Update | `0 6 * * 0` | Sunday 6am OpenClaw self-update |
| Quarterly Setup Review | `0 9 1 1,4,7,10 *` | Quarterly system review |

## Notes

- All jobs run in isolated sessions (don't affect main session)
- Morning Briefing timeout: 240s
- All jobs use MiniMax-M2.7 model

## Missing Jobs (to re-add)

- End-of-Day Project Summary (was: `0 18 * * 1-5`, 6pm weekdays)
- Weekly Evolver (was: `0 5 * * 0`, Sunday 5am)
- Weekly Workspace Maintenance (was: `0 4 * * 0`, Sunday 4am)

