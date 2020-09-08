#!/bin/sh

DATE=$(date +%Y-%m-%d)
BACKUP_DIR="/home/bak"

## -c indicates creating new archive, -z filters through gzip, -f is file name

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

# could also put place to backup at the end like this example:

# lsblk
# sudo mount /dev/sba1 /mnt/Toshiba/
# tar -cvz \
# --exclude="VirtualBox VMs" \
# --exclude="node_modules" \
# --exclude="venv" \
# --exclude=".cache" \
# --exclude=".debug" \
# --exclude="Applications" \
# --exclude="google-cloud-sdk" \
# --exclude=".zoom" \
# --exclude=".nuget" \
# --exclude="styleImages" \
# --exclude=".android" \
# --exclude="mini-kube" \
# --exclude="Steam" \
# -f /mnt/Toshiba/06-07.tar.gz /home/gautierk
