#!/bin/bash
# Morning briefing — weekday 7am ET
# Projects: ~/.openclaw/workspace/projects/{id}/meta.md

WORKSPACE="/home/nathan/.openclaw/workspace"
cd "$WORKSPACE" || exit 1

TELEGRAM_BOT_TOKEN="${TELEGRAM_BOT_TOKEN:-$(grep TELEGRAM_BOT_TOKEN ~/.zeeclaw/credentials.json 2>/dev/null | cut -d'"' -f4)}"
TELEGRAM_CHAT_ID="${TELEGRAM_CHAT_ID:-8264918962}"

TODAY=$(date '+%Y-%m-%d')
NOW_EPOCH=$(date '+%s')
THREE_DAYS_EPOCH=$((NOW_EPOCH + 259200))

MSG=""
URGENT=""
STALE=""

# Check each project meta.md
for metafile in projects/*/meta.md; do
  [ -f "$metafile" ] || continue
  PROJ=$(basename $(dirname "$metafile"))
  
  # Parse status
  STATUS=$(grep "^\- \*\*Status:\*\*" "$metafile" 2>/dev/null | sed 's/.*\*\*Status:\*\* //' | sed 's/ //g' | tr '[:upper:]' '[:lower:]')
  
  # Parse due date
  DUE_STR=$(grep "^\- \*\*Due date:\*\*" "$metafile" 2>/dev/null | sed 's/.*\*\*Due date:\*\* //' | sed 's/ //g')
  if [ -n "$DUE_STR" ]; then
    DUE_EPOCH=$(date -d "$DUE_STR" '+%s' 2>/dev/null || echo 0)
  else
    DUE_EPOCH=0
  fi
  
  # Parse sent date for stale calc
  SENT_STR=$(grep "^\- \*\*Sent date:\*\*" "$metafile" 2>/dev/null | sed 's/.*\*\*Sent date:\*\* //' | sed 's/ //g')
  if [ -n "$SENT_STR" ]; then
    SENT_EPOCH=$(date -d "$SENT_STR" '+%s' 2>/dev/null || echo 0)
    DAYS_SENT=$(( (NOW_EPOCH - SENT_EPOCH) / 86400 ))
  else
    DAYS_SENT=0
  fi
  
  # Customer and desc from index if available
  CUSTOMER=$(grep "^| $PROJ |" projects/index.md 2>/dev/null | awk -F'|' '{print $3}' | sed 's/^ *//;s/ *$//')
  DESC=$(grep "^| $PROJ |" projects/index.md 2>/dev/null | awk -F'|' '{print $4}' | sed 's/^ *//;s/ *$//')
  
  # Due soon (within 3 days)
  if [ "$DUE_EPOCH" -gt 0 ] && [ "$DUE_EPOCH" -le "$THREE_DAYS_EPOCH" ]; then
    DUE_DISP=$(date -d "$DUE_STR" '+%m/%d' 2>/dev/null || echo "$DUE_STR")
    if [ "$DUE_EPOCH" -lt "$NOW_EPOCH" ]; then
      URGENT="$URGENT\n• $PROJ — $CUSTOMER — **OVERDUE ($DUE_DISP)**"
    else
      URGENT="$URGENT\n• $PROJ — $CUSTOMER — due $DUE_DISP"
    fi
  fi
  
  # Stale (sent 14+ days ago)
  if [ "$STATUS" = "sent" ] && [ "$DAYS_SENT" -ge 14 ]; then
    STALE="$STALE\n• $PROJ — $CUSTOMER — ${DAYS_SENT}d since sent"
  fi
done

# Weather
WEATHER=$(curl -s "wttr.in/Greensboro?format=%c+%t,+%w+wind&u" 2>/dev/null | tr -d '\n')
if [ -z "$WEATHER" ] || [ "$WEATHER" = " " ]; then
  WEATHER="unavailable"
fi

# Build message
if [ -n "$URGENT" ]; then
  MSG="**Due soon:**$URGENT"
fi

if [ -n "$STALE" ]; then
  MSG="$MSG\n\n**Stale quotes (14+ days):**$STALE"
fi

MSG="$MSG\n\n**Weather:** $WEATHER"

# Send
if [ -z "$TELEGRAM_BOT_TOKEN" ]; then
  echo -e "Good morning.\n$MSG"
  exit 0
fi

curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
  -d "chat_id=$TELEGRAM_CHAT_ID" \
  -d "text=$(echo -e "Good morning.\n$MSG" | sed 's/\\n/ /g')" \
  -d "parse_mode=Markdown" > /dev/null 2>&1

echo "Morning brief sent at $(date)"
