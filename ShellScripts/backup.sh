#!/bin/bash
# Author: Ayaan Ali | Roll Number: 2601730076
# Creates a compressed backup of a specified directory.

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

SOURCE="$(realpath "$1")"
BACKUP_DIR="$HOME/Developer-Portfolio_Backups"
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
ARCHIVE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

if tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    SIZE="$(du -h "$ARCHIVE" | awk '{print $1}')"
    echo "Backup successful!"
    echo "Backup file: $(basename "$ARCHIVE")"
    echo "Backup size: $SIZE"
    echo "$TIMESTAMP | SUCCESS | $(basename "$ARCHIVE") | Size: $SIZE" >> "$BACKUP_DIR/backup.log"
else
    echo "Error: Backup failed."
    echo "$TIMESTAMP | FAILURE | Backup failed" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
