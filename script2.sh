#!/usr/bin/env bash
backup_files="/home/marie/Desktop/files"
dest="/home/marie/Desktop/backup"
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"
echo "Backing up $backup_files to $dest/$archive_file"
date
echo
tar czf $dest/$archive_file $backup_files
echo
echo "Backup finished"
date
ls -lh $dest
