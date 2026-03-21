#!/bin/bash
# Weekly OpenClaw self-update check — Sunday 6am ET

OUT=$(openclaw update --dry-run 2>&1)
UPDATE_AVAILABLE=$(echo "$OUT" | grep -c "Target version" || true)

if [ "$UPDATE_AVAILABLE" -gt 0 ]; then
  echo "[OpenClaw] Update available — applying..."
  openclaw update --channel stable --yes 2>&1 | tail -5
  openclaw restart 2>&1
  echo "[OpenClaw] Done."
else
  echo "[OpenClaw] No update available — current version is up to date."
fi
