#!/bin/bash
# End-of-day summary — runs at 6pm ET
# Sends Telegram with today's changes and tomorrow's priorities

WORKSPACE="/home/nathan/.openclaw/workspace"
TELEGRAM_BOT_TOKEN="${TELEGRAM_BOT_TOKEN:-$(grep TELEGRAM_BOT_TOKEN ~/.zeeclaw/credentials.json 2>/dev/null | cut -d'"' -f4)}"
TELEGRAM_CHAT_ID="${TELEGRAM_CHAT_ID:-8264918962}"

TODAY=$(date '+%Y-%m-%d')
NOW_EPOCH=$(date '+%s')

# Get today's git commits
TODAY_COMMITS=$(cd "$WORKSPACE" && git log --since="6 hours ago" --oneline 2>/dev/null | wc -l | tr -d ' ')

# Get current project statuses
PROJECTS=$(cat "$WORKSPACE/projects/index.md" 2>/dev/null | grep "^|" | grep -v "^|#" | tail -n +1)
QUOTING_COUNT=$(echo "$PROJECTS" | grep -c "quoting" || echo 0)
SENT_COUNT=$(echo "$PROJECTS" | grep -c "sent" || echo 0)

# Build message
MSG=""

if [ "$TODAY_COMMITS" -gt 0 ]; then
  MSG="$MSG\n• $TODAY_COMMITS workspace commit(s) today"
fi

if [ "$QUOTING_COUNT" -gt 0 ]; then
  MSG="$MSG\n• $QUOTING_COUNT active quotes"
fi

if [ "$SENT_COUNT" -gt 0 ]; then
  MSG="$MSG\n• $SENT_COUNT quotes sent"
fi

# Tomorrow's priorities from today's date
TOMORROW_PROJECTS=$(echo "$PROJECTS" | grep -E "due 03/2[89]|due 03/3[01]" || echo "")
if [ -n "$TOMORROW_PROJECTS" ]; then
  MSG="$MSG\n\n**Due soon:**"
  echo "$TOMORROW_PROJECTS" | while IFS='|' read -r id cust desc status date; do
    [ -z "$id" ] && continue
    id=$(echo "$id" | tr -d ' ')
    cust=$(echo "$cust" | tr -d ' ')
    MSG="$MSG\n• $id — $cust"
  done
fi

if [ -z "$MSG" ]; then
  MSG="Clear day. No significant changes."
fi

FINAL_MSG="**End of Day — $(date '+%m/%d')**$MSG"

# Send
if [ -z "$TELEGRAM_BOT_TOKEN" ]; then
  echo -e "$FINAL_MSG"
  exit 0
fi

curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
  -d "chat_id=$TELEGRAM_CHAT_ID" \
  -d "text=$(echo -e "$FINAL_MSG" | sed 's/\\n/ /g')" \
  -d "parse_mode=Markdown" > /dev/null 2>&1

echo "End-of-day summary sent at $(date)"
