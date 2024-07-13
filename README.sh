#!/bin/bash
## RUN THIS README FILE TO INSTALL ##
re=$(tput sgr0) cyan=$(tput setaf 6 bold); tput indn $((LINES-6)) cup 2;
echo -e "\n\n$cyan
                                     ░▒▒▒░  ░░▒▒░                            
                               ▒▓█▓▓▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░                   
                 ░▒▓▓▓▓▓▓▓▒▒▓▓▓▓▓▓▒▒░░ ░  ░░ ░   ░░░░░░▒▒▒▒▒▒▒▒░             
          ▒▓▓▓▓▓▓▓▒▒▒░░░░░░░░▒▒░░▒▒▒░ ░░ ░░     ░░░░░░░░░ ░░░░░▒▒▓▒░         
      ░▒▓█▓▓▓▓▒▒░░░▒░▒▒▒▒▒▒▒▒  ░▒▒▒░░ ░       ░░░░    ░░░░░░░░░ ░░▒▒▒▒░      
     ▒██▓░  ░░░░▒▒▒░ ░░░░  ░▒ ░▒░░░ ▒ ░░░  ░░░░░    ░     ░   ░░▒░░ ░░▒▒▒░   
     ██░▒▒▒░░  ░░▒▒░ ▒     ▒▒░▒░    ▒ ░               ░          ░░░░░ ░▒▓░  
    ░█▓▒▓░ ░ ░░▒   ▒░▒     ▒░▒░░    ░ ░                            ░░░░░ ▒▓░ 
    ▒░░ ▒░░░▒░░▒░░▒▓▒▓░    ▒░░ ░▒▒▒░░ ░                       ░░      ░░░░░▒░
    ▒▒▒▒▒▓▓▓▓░▒░ ░▓█▓██▓░  ░░░▒▒▓▓█▓▒░▒▒░ ░ ░            ░    ░     ░    ░ ▒▒
     ░▓█▓▒░ ▒░▒▒▒▒▒░ ▒██▒░░░░░ ░▒▒▒▒░    ░░░▒▒░░░░░░    ░░░░ ░ ░░        ░░▒▓
       ▒█████░░▓▓▒░ ░ ▒▒░░▒▒▒░ ░▒░░▒▓▒▒░ ▒░▒▓█▓▒░  ░▒▓▒░▒░░▒▒▒░▒▒▓▒░     ░░▒▒
          ░▓███████▒░ ▒▒░ ▒▒▒▒▒░▒  ▒▓▒▒▓█▓░░ ▒▓▓▒░░ ▒░▒▓▒▒░▒▒▒▒▓▓▓▓▒    ░░░▒░
            ░█████████▒░░ ▒▓▓▓▓▓██▓▒▒░ ░░▒▒▓█▓ ▒▒░▒▒░░ ░▒▒▒▒▒▒    ▒▒   ░ ░▒░ 
                   ▒░░▒▒▒▒▒▓██████▒░░░▒▓███▓▓█▒▒░    ░▓█▓▓▓▓████▓▒ ▒▒▒  ░░   
                   ░░ ░▒▒▒░      ▒▒▓▓▒░      █░▒░░▒▓█▓▓░     ░▒▒▓▓▒▒ ▒▒░░    
                   ░▒▒▒░         ░▒▒░        ▓▒▒▒▒▒░             ░▒▒▒▒▒▓     
                                             ░▒░░░                  ▒▓▓▓     
                                                                    ░▒▒░     
$re";
################################
################################
#### DOWNLOAD /ANTS/ FOLDER ####
echo -e "\t $cyan--$re Welcome to ants-installer!"; 
rootest() {
if (($UID==0)); then HOME=$(eval echo ~$SUDO_USER); 
echo -e "\t $cyan--$re You are root, as user: $cyan$SUDO_USER$re & home dir: $(tput rev) $HOME $re\n"; else 
echo -e "\t $cyan--$re You are $cyan$USER$re & home dir: $(tput rev) $HOME $re \n"; fi; }        
rootest
####
echo -ne "\t $cyan--$re Clone github/ants/? "; read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo -ne "\t $cyan--$re Whereto:"; read -ep " " -i "$PWD" "pwd";
sudo rm $pwd/ants -R; sudo git clone https://github.com/aeniks/ants.git "$pwd/ants"; 
if (($UID==0)); then chown $SUDO_USER: $pwd/ants -R; cd $pwd/ants; ls; else sudo chown $USER: $pwd/ants -R; fi; 
cd $pwd/ants; pwd; echo; ll; echo;
fi; echo; 
echo -ne "\t $cyan--$re Update system? "; read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then 
sudo apt update; sudo apt upgrade -y; sudo apt install gh git openssh-server -yqq 2>/dev/null; 
if [ ! $HOME/.ssh/id_ed25519 ]; then ssh-keygen -p -f $HOME/.ssh/id_ed25519; fi; fi; echo -e "\n\n"; 
##
##
###############################
###############################
cd $pwd/ants/installers/; . ..sh/menu.sh
