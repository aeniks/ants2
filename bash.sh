#!/bin/bash
## A better bash. Written by 12ants.github.io
################################
################ _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; 
then . /etc/bash_completion; fi; fi; 
export EDITOR='micro'; export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
################################
################ _colors
bla="\e[0;30m"; red="\e[0;31m"; gre="\e[0;32m"; yel="\e[0;33m"; blu="\e[0;34m"; pur="\e[0;35m"; cya="\e[0;36m"; whi="\e[0;37m"; re="\e[0m"
bbla="\e[1;30m"; bred="\e[1;31m"; bgre="\e[1;32m"; byel="\e[1;33m"; bblu="\e[1;34m"; bpur="\e[1;35m"; bcya="\e[1;36m"; bwhi="\e[1;37m";
ula="\e[4;30m"; ured="\e[4;31m"; ugre="\e[4;32m"; uyel="\e[4;33m"; ublu="\e[4;34m"; upur="\e[4;35m"; ucya="\e[4;36m"; uwhi="\e[4;37m";
bgla="\e[40m"; bgred="\e[41m"; bggre="\e[42m"; bgyel="\e[43m"; bgblu="\e[44m"; bgpur="\e[45m"; bgcya="\e[46m"; bgwhi="\e[47m";
bold="\e[1m"; dim="\e[2m"; italic="\e[3m"; underline="\e[44m"; blink="\e[45m"; rev="\e[47m"; invis="\e[8m"; strike="\e[9m"; c2=""$cya" --$re"; 
################################
e='echo -e '; c2=$($e'\e[36m --\e[0m'); cyan=$($e'\e[36m'); green=$($e'\e[32m'); red=$($e'\e[31m'); 
. /home/ants2/alias.sh; . /home/ants2/functions.sh;
################_ lfilemanager
LFRC='/ants/sh/config/lfrc.sh'; if [ -e /bin/lf ]; then bind '"\C-l":"lfcd\C-m"'; alias l='cd $(lf -config $LFRC -print-last-dir )';
lfcd () { cd "$(command lf -config $LFRC -print-last-dir "$@")"; } fi; 
################################
################################
################ _functions
cd () { builtin cd "$@" && ls --hyperlink -hltrp --color=always --group-directories-first; }
################################
################ _alias
alias ee='echo ';
alias ll='ls --hyperlink -hltrp --color=always --group-directories-first'; 
alias la='ls --hyperlink -Ahltrp --color=always --group-directories-first; pwd'; 
alias sl='ssh -Xp 44444 aaaa@ants.ftp.sh'; 
alias m8='ssh -p 8022 4.4.4.5'
iploc="$(ip a|head -n 12|tail -n 4|grep "inet "|tr -s "[:alpha:] /\n" " \n"|head -n2|tail -n1 2>/dev/null)"; 
ip4="$(curl -4 ip.me -s&)"; zz=' 2>/dev/null'; 
################ _variables
export m8='62e27586_c5be_4dd2_a26c_6c558847cf63';
alias nvm_init='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" \
|| printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; ';
################################
#env=~/.ssh/agent.env
#agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
#agent_start () {
#    (umask 077; ssh-agent >| "$env")
#    . "$env" >| /dev/null ; }
#agent_load_env 2>/dev/null; 
## agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
#agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#    agent_start
#    ssh-add
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add
#fi
#unset env
#######
##########################
#### Welcome screen ######
##########################
####
if [ -e /bin/neofetch ]; then neofetch; fi 
echo -e "
  $c2 Welcome back $blu $USER, $re today is:$blu $(date) $re
  $c2 Public ip: $gre$ip4$re 
  $c2 Local  ip: $cya$iploc$re";
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e "  $c2 $bold"$red"ssh$re from$re: $cya${shsh[0]}$re to$re $cya${shsh[2]}$re:$cya${shsh[3]}$re\n"; fi; echo;
PS1=''$re$blu$dim'$(date +%T)'$red' \u '$gre'\H '$cya'$PWD\e[2:$((RANDOM%5+1));$((RANDOM%15+1))m \$ '$re'\n'
