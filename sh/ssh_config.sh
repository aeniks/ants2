
#### SSH
####
tput indn 22;
tput cuu 4 cuf 8; read -ep " -- Where to store ssh-key: " -i "$HOME/.ssh/" "sshkeyloc"; 
tput cuf 8; read -ep " -- Domain for ssh: " -i '*' "sshdomain"
tput cuf 8; read -ep " -- Add ssh-agent? " -i 'y' "yno"
if [ $yno == y ]; then
echo '
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }
agent_load_env
# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi
unset env
##
##
' >> "$HOME/.bashrc"
fi
ssh -T git@github.com; 
echo "
Host *
   ForwardAgent yes
   Banner /ants/sh/sshbanner.net
   " >> "/etc/ssh/ssh_config"; 
echo ""; 
####
####
##
################
## ROOT-CHECK ##

################
################
##
##cd /ants 2>/dev/null && git pull; 
##sudo git clone git@github.com:aeniks/ants.git /ants/; 
##if [ -u != 0 ]; then 
##chown $SUDO_USER /ants -R; else 
##sudo chown $USER /ants -R; fi; 
##cd /ants; ll; echo -e "\n\n\t Done \n\n"
##. /sh/installer.sh;
##echo gg


