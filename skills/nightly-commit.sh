#!/bin/bash
# Nightly auto-commit for workspace

WORKSPACE="/home/nathan/.openclaw/workspace"
cd "$WORKSPACE" || exit 1

# Check for changes
git status --porcelain | grep -q "." || exit 0

# Stage all changes
git add -A

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d')
git commit -m "auto: nightly snapshot $TIMESTAMP"

exit 0
