#!/bin/sh

DATE=$(date +%Y-%m-%d)
BACKUP_DIR="/home/bak"

tar -zcvpf $BACKUP_DIR/laydros-backup-$DATE.tar.gz \
    --exclude='/home/laydros/dl/iso' \
    --exclude=.cache \
    --exclude=.debug \
    --exclude=.gvfs \
    --exclude=.thumbnails \
    --exclude=.dbus \
    --exclude=.local/share/gvfs-metadata \
    --exclude=.local/share/Trash \
    /home/laydros

# Delete files older than 10 days
# find $BACKUP_DIR/* -mtime +10 -exec rm {} \;
