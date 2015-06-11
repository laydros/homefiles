#!/bin/bash

# Daily org file backup

# needed variables
day=$(date +%F)
rootPath="/home/laydros/Dropbox/Documents"
orgDir=org/
backupFile=$rootPath/org-backup/$day.tar.gz

# Backup files
tar cpzf $backupFile -C $rootPath $orgDir

# remove backup files older than 90 days
#find $backupFile* -mtime +90 -exec rm {} \;

# to exclude certain directories
#tar cpzf $File --exclude "${Folder}Downloads" $Folder
