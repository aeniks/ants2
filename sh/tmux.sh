#!/bin/bash
## TMUX and CONFIG
##
if [ $UID != 0 ] ; then echo -e " \n\n\t This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; exit 1; fi; ## ROOT-CHECK
sudo apt install -y perl sed tmux; 
#wget https://github.com/12ants/0000/raw/main/etc/.tmux.conf
#wget https://github.com/12ants/0000/raw/main/etc/.tmux.conf.local
#cd $ghh/0000/etc; 
cp ../conf/.tmux.conf /root/; 
cp ../conf/.tmux.conf.local /root/;
cp ../conf/.tmux.conf /home/$SUDO_USER/; 
cp ../conf/.tmux.conf.local /home/$SUDO_USER/;
chown $SUDO_USER: /home/$SUDO_USER -R; 
echo "$ll$c2 Tmux installed and configured . . . "
##
# ln /home/$SUDO_USER/.conf/.tmux.conf /root/; 
# ln /home/$SUDO_USER/.conf/.tmux.conf.local /root/
##
