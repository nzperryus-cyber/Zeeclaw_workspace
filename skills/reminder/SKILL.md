# Reminder Skill

Manage reminders using cron for time-specific delivery.

## Commands

### Set Reminder

When Nathan says "remind me at [time] to [message]":
1. Parse the datetime from the message
2. Create a cron job with `schedule.kind="at"` using the exact time
3. Set `sessionTarget="main"` and `payload.kind="systemEvent"` with the reminder text
4. Confirm: "Reminder set for [time]: [message]"

### List/Cancel Reminders

When Nathan says "show reminders" or "cancel reminder [title]":
1. Run `openclaw cron list` to list active cron jobs
2. For cancellation, use `openclaw cron remove <jobId>`

## Notes

- Always use cron — it delivers at the exact time specified
- Google Tasks is not used for reminders
- Reminders fire as Telegram messages via the main session
