#!/bin/bash
## update grub
mkdir -p -m 775 /boot/grub/;  cd /boot/grub/; 
wget -O tard.jpg https://github.com/12ants/00/raw/main/img/tard2.jpg;
sudo chmod 775 tard.jpg;
#mkdir -p -m 775 "/bu/grub/";
#mv /etc/default/grub.d -R  /bu/grub/;
echo '
GRUB_BACKGROUND="/boot/grub/tard.jpg"
GRUB_GFXMODE=auto
#GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=2
GRUB_DISTRIBUTOR=`lsb_release -dcs 2> /dev/null || echo Debian`
GRUB_DISABLE_OS_PROBER=false
GRUB_HIDDEN_TIMEOUT=0
#GRUB_CMDLINE_LINUX="console" 
#GRUB_CMDLINE_LINUX_DEFAULT="gfxterm" 
GRUB_GFXPAYLOAD_LINUX=keep
' > /etc/default/grub; 
update-grub; 
echo "grub updated"
