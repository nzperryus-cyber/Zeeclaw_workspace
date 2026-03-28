#!/bin/bash
# Nightly auto-commit for workspace

WORKSPACE="/home/nathan/.openclaw/workspace"
LOG="$WORKSPACE/skills/nightly-commit.log"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >> "$LOG"
}

cd "$WORKSPACE" || { log "ERROR: Cannot cd to $WORKSPACE"; exit 1; }

# Check for changes
git status --porcelain | grep -q "." || { log "No changes to commit"; exit 0; }

# Stage all changes
git add -A || { log "ERROR: git add failed"; exit 1; }

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d')
git commit -m "auto: nightly snapshot $TIMESTAMP" || { log "ERROR: git commit failed"; exit 1; }

log "Committed nightly snapshot $TIMESTAMP"
exit 0
