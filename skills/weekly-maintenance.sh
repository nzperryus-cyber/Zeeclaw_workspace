#!/bin/bash
# Weekly workspace maintenance check
# Scans for: broken symlinks, empty dirs, files >10MB

WORKSPACE="/home/nathan/.openclaw/workspace"
LOG="$WORKSPACE/maintenance-log.md"
ISSUES_FOUND=0

echo "" >> "$LOG"
echo "---" >> "$LOG"
echo "## Weekly Maintenance — $(date '+%Y-%m-%d %a %H:%M %Z')" >> "$LOG"

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

if [ $ISSUES_FOUND -eq 0 ]; then
  echo "**Status:** All clean ✅" >> "$LOG"
else
  echo "" >> "$LOG"
  echo "**Action needed.** Review above items." >> "$LOG"
fi

exit 0
