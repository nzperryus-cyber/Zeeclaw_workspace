#!/bin/bash
# Weekly workspace maintenance check
# Scans for: broken symlinks, empty dirs, files >10MB, disk space,
#            gog auth, git uncommitted, sessions, temp files, machine load,
#            cron jobs, Drive backup, git push, memory logs, skills, RFQ files

WORKSPACE="/home/nathan/.openclaw/workspace"
LOG="$WORKSPACE/maintenance-log.md"
ISSUES_FOUND=0

echo "" >> "$LOG"
echo "---" >> "$LOG"
echo "## Weekly Maintenance — $(date '+%Y-%m-%d %a %H:%M %Z')" >> "$LOG"

# ---- Workspace checks ----

# Broken symlinks
BROKEN_LINKS=$(find "$WORKSPACE" -type l ! -exec test -e {} \; -print 2>/dev/null)
if [ -n "$BROKEN_LINKS" ]; then
  echo "" >> "$LOG"
  echo "**Broken symlinks:**" >> "$LOG"
  echo "$BROKEN_LINKS" | while read -r link; do echo "  - $link" >> "$LOG"; done
  ISSUES_FOUND=1
fi

# Empty directories
EMPTY_DIRS=$(find "$WORKSPACE" -type d -empty 2>/dev/null | grep -v "\.git" | grep -v "^\.$")
if [ -n "$EMPTY_DIRS" ]; then
  echo "" >> "$LOG"
  echo "**Empty directories:**" >> "$LOG"
  echo "$EMPTY_DIRS" | while read -r dir; do echo "  - $dir" >> "$LOG"; done
  ISSUES_FOUND=1
fi

# Files over 10MB
BIG_FILES=$(find "$WORKSPACE" -type f -size +10M 2>/dev/null)
if [ -n "$BIG_FILES" ]; then
  echo "" >> "$LOG"
  echo "**Large files (>10MB):**" >> "$LOG"
  echo "$BIG_FILES" | while read -r file; do
    SIZE=$(du -h "$file" | cut -f1)
    echo "  - $file ($SIZE)" >> "$LOG"
  done
  ISSUES_FOUND=1
fi

# ---- Git uncommitted changes ----
cd "$WORKSPACE"
if ! git diff HEAD --quiet 2>/dev/null; then
  echo "" >> "$LOG"
  echo "**Git uncommitted changes:** yes ⚠️" >> "$LOG"
  ISSUES_FOUND=1
fi

# ---- Git push status ----
if ! git rev-parse @{u} >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "**Git remote:** No upstream configured ⚠️" >> "$LOG"
  ISSUES_FOUND=1
else
  PUSH_NEEDED=$(git log origin/main..main 2>/dev/null | wc -l)
  if [ "$PUSH_NEEDED" -gt 0 ]; then
    echo "" >> "$LOG"
    echo "**Git remote:** $PUSH_NEEDED commit(s) behind origin ⚠️" >> "$LOG"
    ISSUES_FOUND=1
  fi
fi

# ---- Disk space (workspace volume) ----
WORKSPACE_DISK=$(df -h "$WORKSPACE" | tail -1 | awk '{print $5}' | tr -d '%')
if [ "$WORKSPACE_DISK" -gt 80 ]; then
  echo "" >> "$LOG"
  echo "**Disk usage:** ${WORKSPACE_DISK}% used ⚠️" >> "$LOG"
  ISSUES_FOUND=1
fi

# ---- gog auth token validity ----
GOG_OUT=$(gog drive ls --account nzperryus@gmail.com 2>&1 | head -1 || true)
if echo "$GOG_OUT" | grep -qi "invalid_grant\|expired\|unauthorized\|error"; then
  echo "" >> "$LOG"
  echo "**gog Drive auth:** Token expired or invalid ⚠️" >> "$LOG"
  ISSUES_FOUND=1
fi

# ---- Drive backup check ----
DRIVE_BACKUP_ID="17YBaOOHxNOWOzB-_dHKhFy7tJp9juqct"
DRIVE_FILE=$(gog drive ls --account nzperryus@gmail.com --parent "$DRIVE_BACKUP_ID" 2>&1 | tail -n +2 | head -1 || true)
if [ -n "$DRIVE_FILE" ]; then
  # Check if most recent backup is from today or yesterday
  echo "" >> "$LOG"
  echo "**Drive backup:** $DRIVE_FILE" >> "$LOG"
else
  echo "" >> "$LOG"
  echo "**Drive backup:** No backup found in Zeeclaw folder ⚠️" >> "$LOG"
  ISSUES_FOUND=1
fi

# ---- Cron job last-run check ----
echo "" >> "$LOG"
echo "**Cron jobs:**" >> "$LOG"
openclaw cron list 2>/dev/null | while read -r line; do
  echo "  $line" >> "$LOG"
done

# ---- OpenClaw health check ----
OC_STATUS=$(openclaw status --deep 2>&1)
OC_CRITICAL=$(echo "$OC_STATUS" | grep -c "CRITICAL" || true)
OC_WARNS=$(echo "$OC_STATUS" | grep -c "WARN" || true)

if [ "$OC_CRITICAL" -gt 0 ]; then
  echo "" >> "$LOG"
  echo "**OpenClaw Critical Issues:**" >> "$LOG"
  echo "$OC_STATUS" | grep -A2 "CRITICAL" | while read -r line; do echo "  $line" >> "$LOG"; done
  ISSUES_FOUND=1
fi

if [ "$OC_WARNS" -gt 0 ]; then
  echo "" >> "$LOG"
  echo "**OpenClaw Warnings:** $OC_WARNS warning(s)" >> "$LOG"
fi

# ---- Machine load (last 5 min avg) ----
LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
echo "" >> "$LOG"
echo "**Machine load (5m avg):** $LOAD" >> "$LOG"

# ---- Temp file cleanup (openclaw /tmp) ----
TEMP_SIZE=$(du -sh /tmp/openclaw 2>/dev/null | cut -f1 || echo "n/a")
echo "**OpenClaw /tmp size:** $TEMP_SIZE" >> "$LOG"

# ---- Tailscale status ----
TAILSCALE_OUT=$(tailscale status 2>&1 | head -1 || true)
if [ -n "$TAILSCALE_OUT" ]; then
  echo "**Tailscale:** $TAILSCALE_OUT" >> "$LOG"
fi

# ---- Memory log pruning ----
MEMORY_LOGS=$(find "$WORKSPACE/memory" -name "????-??-??.md" 2>/dev/null | wc -l | tr -d ' ')
MEMORY_SIZE=$(du -sh "$WORKSPACE/memory" 2>/dev/null | cut -f1 || echo "n/a")
echo "" >> "$LOG"
echo "**Memory logs:** $MEMORY_LOGS files, $MEMORY_SIZE" >> "$LOG"
if [ "$MEMORY_LOGS" -gt 90 ]; then
  echo "**Memory log pruning recommended:** $MEMORY_LOGS files (consider archiving old ones)" >> "$LOG"
fi

# ---- Skills installed check ----
echo "" >> "$LOG"
echo "**Skills:**" >> "$LOG"
ls "$WORKSPACE/skills/" 2>/dev/null | while read -r s; do echo "  - $s" >> "$LOG"; done
echo "  [system skills]" >> "$LOG"
ls "$HOME/.openclaw/skills/" 2>/dev/null | while read -r s; do echo "  - $s" >> "$LOG"; done

# ---- RFQ project files accessibility ----
echo "" >> "$LOG"
echo "**RFQ shared_folder check:**" >> "$LOG"
for proj in "25-67725 - Ford Plasma Cells" "25-72998 - MBUSI Gluing Cell" "25-72313 - Ford FRAP Mega Cell" "25-71662 - Ford Cobot Projects" "24-68775 - Metalsa Frame Wax"; do
  PROJ_PATH="$HOME/shared_folder/Projects/$proj"
  if [ -d "$PROJ_PATH" ]; then
    FILE_COUNT=$(find "$PROJ_PATH" -type f 2>/dev/null | wc -l)
    echo "  ✓ $proj: $FILE_COUNT file(s)" >> "$LOG"
  else
    echo "  ✗ $proj: folder not found ⚠️" >> "$LOG"
    ISSUES_FOUND=1
  fi
done

# ---- Summary ----
echo "" >> "$LOG"
if [ $ISSUES_FOUND -eq 0 ]; then
  echo "**Status:** All clean ✅" >> "$LOG"
else
  echo "**Status:** $ISSUES_FOUND issue(s) found ⚠️" >> "$LOG"
fi

exit 0
