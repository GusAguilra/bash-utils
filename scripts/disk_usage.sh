#!/bin/bash
# Disk usage checker

THRESHOLD=80

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "⚠️ Disk usage above threshold: $USAGE%"
else
  echo "✅ Disk usage is OK: $USAGE%"
fi
