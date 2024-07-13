#!/bin/bash
##
## 0000/etc/grub.sh
## About: Grub sh script.
##
#grub


mkdir -p -m 775 /boot/grub 2>/dev/null; 
if (($UID==0)); then 
chown $SUDO_USER: /boot/grub -R;
fi
sudo cp /ants/media/tard.jpg /boot/grub/tard.jpg; chmod 775 /boot/grub/tard.jpg;
echo '
GRUB_BACKGROUND="/boot/grub/tard.jpg"
GRUB_GFXMODE=auto
GRUB_TERMINAL_OUTPUT="console"
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=4
GRUB_DISTRIBUTOR=`lsb_release -dcs 2> /dev/null || echo Debian`
GRUB_DISABLE_OS_PROBER=false
GRUB_HIDDEN_TIMEOUT=0
#GRUB_CMDLINE_LINUX="console"
GRUB_CMDLINE_LINUX_DEFAULT="console"
GRUB_GFXPAYLOAD_LINUX=keep
' > /etc/default/grub;
update-grub ;
echo -e "\n\n$c2 GRUB_2 updated . . . \n\n"
