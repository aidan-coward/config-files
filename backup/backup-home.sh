#!/bin/bash

log_file="/home/aidan/documents/linux/arch/log-files/backup/backup-home-$(date +%Y-%m-%d).log"

echo "creating log file"
touch $log_file
echo "changing owner of log file"
chown aidan $log_file

echo "running backup with rsync"
rsync -qaAXHS --delete --stats --log-file=$log_file --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*"} / /home/backup/

echo "emailing results"
mail -s "jade-sky backup report '$(date +%Y-%m-%d)'" aidan.coward@gmail.com < $log_file 
