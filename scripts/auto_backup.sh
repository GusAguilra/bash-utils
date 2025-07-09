#!/bin/bash

# Simple backup script

SRC="$HOME/Documents"
DEST="$HOME/backup_$(date +%Y%m%d)"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"

echo "Backup of $SRC completed at $DEST"
