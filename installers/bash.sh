#!/bin/bash 
echo -e "\n\t $c2 Udating$cyan /etc/bash.bash$re &$cyan ~/.bashrc$re "; tput civis; 
echo -ne "\t"; for i in {1..22}; do tput setaf $((RANDOM%14+1)); echo -ne " -"|pv --quiet --rate-limit 12; done; 
tput rc cnorm; echo;
if [ $UID = 0 ]; 
then sudo chown $SUDO_USER /ants -R; sudo chmod 775 /ants -R; 
else sudo chown $USER /ants -R; sudo chmod 775 /ants -R; 
fi; 
sudo cp /ants/sh/bash_etc.sh /etc/bash.bashrc; sudo chmod 775 /etc/bash.bashrc; 
sudo cp /ants/sh/bashrc.sh ~/.bashrc; sudo chmod 775 ~/.bashrc; 
echo -e "\n\t $c2 Done \n"
