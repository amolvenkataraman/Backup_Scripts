#!/bin/bash

# Back up a FULL Postgres database to a specified directory

# Configuration
BACKUP_DIR="/mnt/data//Backups/Postgres" # CHANGEME Replace this with your desired backup location
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_PATH="$BACKUP_DIR/basebackup_$TIMESTAMP"

# Ensure backup directory exists
mkdir -p "$BACKUP_PATH"

# Run base backup
pg_basebackup -U amol -D "$BACKUP_PATH" -Ft -z -X fetch # CHANGEME Replace 'amol' with your username

# Remove old backups (keep last 14 days)
find "$BACKUP_DIR" -type d -mtime +14 -exec rm -rf {} +
# CHANGEME Replace +14 above with +n, where n is the number of days' backups you want to keep
