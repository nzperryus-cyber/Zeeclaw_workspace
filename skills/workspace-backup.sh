#!/bin/bash
# Nightly workspace backup to Google Drive — runs 2am ET

WORKSPACE="/home/nathan/.openclaw/workspace"
BACKUP_DATE=$(date '+%Y-%m-%d')
BACKUP_NAME="workspace-backup-${BACKUP_DATE}.tar.gz"
BACKUP_TMP="/tmp/${BACKUP_NAME}"

# Stage and commit all workspace changes
cd "$WORKSPACE" && git add -A

# Commit only if there are actual changes
if ! git diff --quiet HEAD 2>/dev/null; then
  git commit -m "auto: nightly snapshot $(date '+%Y-%m-%d')"
fi

# Create tar archive (exclude .git and node_modules)
tar -czf "$BACKUP_TMP" \
  --exclude='.git' \
  --exclude='node_modules' \
  -C /home/nathan/.openclaw/workspace . 2>/dev/null

# Upload to Google Drive if the archive exists
if [ -f "$BACKUP_TMP" ]; then
  gog drive upload "$BACKUP_TMP" --account nzperryus@gmail.com 2>&1
  rm -f "$BACKUP_TMP"
fi
