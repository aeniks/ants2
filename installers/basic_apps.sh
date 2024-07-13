#/bin/bash
# Installs basic apps and functions
tput dim; 
sudo apt update; sudo apt upgrade -y;
##################
basicapps=(
micro
openssh-server
net-tools
lolcat
fortunes
fortune-mod
cowsay
neofetch
mc
btop
gpm
links2
ranger
pv
fortune-mod
tlp
googler
lf
)

#############
sudo apt -qqy install ${basicapps[@]}; 
##############
echo;echo;
#echo "${cows[$((RANDOM%${#cows[@]}))]}"
ln /usr/games/fortune /bin/
fortunes=$(ls /usr/share/games/fortunes)
cows=($(ls /usr/share/cowsay/cows|sed s/.cow//g)); 
#alias qqqq='/usr/games/fortune|/usr/games/cowthink -f ${cows[$((RANDOM%${#cows[@]}))]}|lolcat;'
echo "Installing ssss";
sudo cp /ants/sh/ssss.sh /bin/ssss;
sudo chown $SUDO_USER:$USER /bin/ssss;
sudo chmod 775 /bin/ssss;
echo "ok";
#!/bin/bash
# About: gpm links2 ranger mc lolcat googler...
##
## 0000/etc/basic_apps.sh
##
# BASIC APPS #
##############
#### nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash 
export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";  # This loads nvm
##########
echo "$ll$c2 OK"
echo gg
##
##
##
##
