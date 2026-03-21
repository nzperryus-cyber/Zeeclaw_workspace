#!/bin/bash
# Morning briefing — weekday 7am ET

WORKSPACE="/home/nathan/.openclaw/workspace"
cd "$WORKSPACE" || exit 1

# Load project data
source "$WORKSPACE/.projects.env" 2>/dev/null

TODAY=$(date '+%Y-%m-%d')
THREE_DAYS=$(date -d "+3 days" '+%Y-%m-%d' 2>/dev/null || date -v+3d '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d' 2>/dev/null || date -v-1d '+%Y-%m-%d')

MSG=""

# Check projects due in next 3 days or today
DUE_SOON=$(grep -l "due $TODAY\|due $THREE_DAYS\|due $(date -d "+1 day" '+%Y-%m-%d' 2>/dev/null || date -v+1d '+%Y-%m-%d')\|due $(date -d "+2 days" '+%Y-%m-%d' 2>/dev/null || date -v+2d '+%Y-%m-%d')" projects/*.md 2>/dev/null | head -5)
if [ -n "$DUE_SOON" ]; then
  for f in $DUE_SOON; do
    PROJ=$(basename "$f" .md)
    DUE=$(grep "^due:" "$f" 2>/dev/null || grep "due " "$f" | head -1)
    DESC=$(grep "^description:" "$f" 2>/dev/null || grep "^- " "$f" | head -1)
    MSG="$MSG\n• $PROJ: $DESC (DUE: $DUE)"
  done
fi

# Check stale sent quotes (14+ days old)
STALE=""
for f in projects/*.md 2>/dev/null; do
  [ -f "$f" ] || continue
  if grep -q "status: sent" "$f"; then
    SENT_DATE=$(grep "^sent:" "$f" 2>/dev/null | cut -d' ' -f2)
    [ -z "$SENT_DATE" ] && continue
    SENT_EPOCH=$(date -d "$SENT_DATE" '+%s' 2>/dev/null || echo 0)
    NOW_EPOCH=$(date '+%s')
    DAYS=$(( (NOW_EPOCH - SENT_EPOCH) / 86400 ))
    if [ "$DAYS" -ge 14 ]; then
      PROJ=$(basename "$f" .md)
      STALE="$STALE\n• $PROJ — ${DAYS}d since sent"
    fi
  fi
done
if [ -n "$STALE" ]; then
  MSG="$MSG\n\n**Stale quotes (14+ days):**$STALE"
fi

# Weather
WEATHER=$(curl -s "wttr.in/Greensboro?format=%c+%t,+%w+wind&u" 2>/dev/null | tr -d '\n')
if [ -n "$WEATHER" ]; then
  MSG="$MSG\n\n**Greensboro:** $WEATHER"
fi

# Final output
if [ -z "$MSG" ]; then
  echo "Clear board. Good morning."
else
  echo -e "Good morning. Here's what matters:\n$MSG"
fi
