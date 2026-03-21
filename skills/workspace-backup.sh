#!/bin/bash
# Nightly workspace backup to Google Drive — Zeeclaw folder
# Runs 2am ET

WORKSPACE="/home/nathan/.openclaw/workspace"
FOLDER_ID="17YBaOOHxNOWOzB-_dHKhFy7tJp9juqct"
BACKUP_NAME="workspace-$(date '+%Y-%m-%d').tar.gz"
BACKUP_TMP="/tmp/${BACKUP_NAME}"

# Stage and commit all workspace changes
cd "$WORKSPACE" && git add -A

# Commit only if there are actual changes
if ! git diff HEAD --quiet 2>/dev/null; then
  git commit -m "auto: workspace snapshot $(date '+%Y-%m-%d')"
fi

# Create tar (exclude node_modules and .git)
tar -czf "$BACKUP_TMP" \
  --exclude='node_modules' \
  --exclude='.git' \
  -C "$WORKSPACE" .

# Upload to Zeeclaw folder on Drive
if [ -f "$BACKUP_TMP" ]; then
  gog drive upload "$BACKUP_TMP" \
    --account nzperryus@gmail.com \
    --parent "$FOLDER_ID" 2>/dev/null
  rm -f "$BACKUP_TMP"
fi
