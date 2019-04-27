#!/bin/bash

log_file="/home/aidan/documents/linux/arch/log-files/backup/backup-$(date +%Y-%m-%d).log"

echo "creating log file"
touch $log_file
echo "changing owner of log file"
chown aidan $log_file

echo "running backup with rsync"
rsync -qaAXHS --delete --stats --log-file=$log_file --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/aidan/.rtorrent-session/*","/home/aidan/.rtorrent-session-torrentday/*","/home/*/.cache/chromium","/home/*/.local/share/Trash/*","/home/*/.cache/qutebrowser/*","/home/aidan/Downloads/*","/home/aidan/'Virtualbox VMs'", "/home/aidan/torrent", "home/aidan/media"} / /mnt/external/backup

echo "emailing results"
mail -s "jade-sky backup report '$(date +%Y-%m-%d)'" aidan.coward@gmail.com < $log_file 
