# Reminder Skill

Manage reminders by adding them to Google Tasks.

## Setup

- Google Tasks API must be enabled in Google Cloud Console
- Run `gog auth add <email> --services=tasks` to authorize
- Task list ID: `MTY5NTc5MDE2MDgyMDgwNjA3NDE6MDow` ("My Tasks")

## Triggers

- "remind me..." / "reminder..." / "set a reminder..."
- Any message that looks like a reminder request

## Commands

### Add Reminder (to Google Tasks)

When Nathan says something like "remind me tomorrow at 3pm to email Bob":
1. Parse the datetime and message
2. Run: `gog tasks add MTY5NTc5MDE2MDgyMDgwNjA3NDE6MDow --title "<message>" --due "<YYYY-MM-DD>"`
3. Confirm to Nathan: "Added to Google Tasks: [message] — due [date]"

### List Reminders (from Google Tasks)

When Nathan says "show reminders" or "what reminders do I have":
1. Run: `gog tasks list MTY5NTc5MDE2MDgyMDgwNjA3NDE6MDow`
2. Format as: `• [title] — due [date]` (show pending tasks)
3. If empty: "No pending reminders"

### Remove/Clear Reminder

When Nathan says "remove reminder [title]" or "complete reminder [title]":
1. Get task ID from `gog tasks list`
2. Run: `gog tasks complete <tasklistId> <taskId>`
3. Confirm to Nathan: "Marked '[title]' complete"

## Notes

- Uses Google Tasks API via gog CLI
- Due dates are date-only (Google ignores time)
- Nathan can manage reminders in Google Tasks app with native notifications
- No cron needed — just add tasks to his Google account