#!/bin/bash
# sync
termux-wifi-connectioninfo|grep "null"|| \
rsync -rPzha -e 'ssh -p 44444' --exclude="Android*" \
/sdcard/ uuuu@ants.ftp.sh:/uuuu/backup/m8/ \
|tee -a rsync_log.sh; 
tail -n4 rsync_log.sh|termux-notification
