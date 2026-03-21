#!/bin/bash
# Weekly workspace maintenance check
# Scans for: broken symlinks, empty dirs, files >10MB, disk space,
#            gog auth, git uncommitted, sessions, temp files, machine load

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
  echo "**Git uncommitted changes:** yes" >> "$LOG"
  ISSUES_FOUND=1
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

# ---- Summary ----
if [ $ISSUES_FOUND -eq 0 ]; then
  echo "" >> "$LOG"
  echo "**Status:** All clean ✅" >> "$LOG"
else
  echo "" >> "$LOG"
  echo "**Action needed.** Review above items." >> "$LOG"
fi

exit 0
