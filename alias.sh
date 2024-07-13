#!/bin/bash
# alias for bash terminal
export EDITOR='micro'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
export PATH="$PATH:/usr/games"
#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
alias netw='ip n | grep -v FAILED|head -n-1'
####
####
#alias apt='sudo apt'
alias info_ansi='less /ants/sh/info/ansi.md'
alias lflf='micro /etc/lf/lfrc.sh;'
alias pick='height="$(stty size|head -c3)"; tput indn $((height/4)) cuu $((height/4-2)); gum choose * --no-limit --cursor=" > " --height $((height/2))'
alias staticants=''
alias 11='kdeconnect-cli -d "62e27586_c5be_4dd2_a26c_6c558847cf63" --ring'; 

norm() { echo -e '\e[0m'; tput cnorm 2>/dev/null; }  
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias 11='ssh ants.swe.net -p 8022 "termux-media-player play /sdcard/Music/money.mp3"'
#alias 22='ssh ants.swe.net -p 8022 "termux-media-player stop"'
#alias aa='if [ $USER = "root" ]; then sudo chown $SUDO_USER: /ants -R; sudo chmod 775 /ants -R; 
#else sudo chown $USER: /ants -R; sudo chmod 775 /ants -R; fi; cd /ants; 
#echo; pwd|pr --omit-header --indent=4|lolcat -p 2; echo; echo -e "$cyan$dim --------$re"; 
#ls -Ahltrp --color=always --group-directories-first; echo -e "$cyan$dim --------$re \n"'
alias aa='cd /ants; echo; pwd|pr --omit-header --indent=4|lolcat -p 2 2>/dev/null; 
echo -e "\n$cyan$dim --------$re"; 
ls -Ahltrp --color=always --group-directories-first; echo -e "$cyan$dim --------$re \n"'
alias aaaa="micro "/ants/alias.sh"; read -ep 'update /ants/alias.sh? '; . /ants/alias.sh;"
alias bbbb="micro "/ants/bash.sh"; read -ep 'update /ants/bash.sh? '; . /ants/bash.sh;"
alias cccc="micro "/ants/functions.sh"; read -ep 'update /ants/functions.sh? '; . /ants/functions.sh;"
####
alias bgbg='tput cup 0 setab $((RANDOM%222 + 44)); for i in $(seq $((LINES * COLUMNS))); 
do echo -n " "; done; tput cup 0'
alias psp='tput indn 12 cuu 8;'
alias ffff='seq -s "-" 2222|lolcat -p .8 -s 2'
#shost="aeniks.mooo.com"; suser="aaaa";
#alias sl='ssh $suser@$shost'
alias serve='read -n1 -ep  "$c2 serve $PWD/? "; npx wrangler pages dev . 2>/dev/null'
#alias wrangler='npx wrangler pages'
alias iplocal='ip route; cat ~/iplog; ' 
alias ants='read -ep "$c2 get ants? " ""; wget -O /tmp/in.sh git.new/ants; . /tmp/in.sh;'
alias lenoo='read -t 8 -ep "$c2 update ants.swe.net to lenoos cmp? " "kndfkd"; curl -k https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1MjY0NTM='
alias rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";'
alias ff='
psp read -ep "$c2 "$rev"new folder?$re " -i "$PWD" "folder"; 
mkdir -p $folder -m 775; 
chown "$SUDO_USER":"$USER" "$folder"; 
cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;'
alias oooo="rrf; fortune; tput sgr0;"
alias rr="sudo -s"
alias besh="micro /etc/bash.bashrc"
alias mm="micro"
alias rw="wotd"
alias zip='echo -ne "\n\t $c2 "; read -ep "zip folder: " -i "$PWD"  "zipf"; 
echo -ne "\n\t $c2"; read -ep "to: " -i "$(wotd|tr -d "''").zip" "zipz";
zip -r $zipz $zipf;'
##
alias qq='cd ..; echo -ne "\t$pinkb $PWD $re\n"; ll -h; echo -ne "\t$pinkb $PWD $re\n";'
alias ww='cd $OLDPWD; echo -ne "\t$pinkb $PWD $re\n"; ll -h; echo -ne "\t$pinkb $PWD $re\n";'
alias bb="btop --utf-force"
############################################
#### GITHUB ################################
alias kk='read -ep ">_ " 'kl'; printf "$kl"|gh gist create -f $(date +%A_%y_%m_%d_%__0k_%M.sh); echo \n\n\t$c2 !$/raw\n\n""'
alias kf='guf=$(gum file);echo -e "\n\n\n\n\n"; tput cuu 2; read -ep "$c2 title: $cyan" -i "$(date +%A%y%m%d%0k%M.sh)" "ttll";cat $guf|gh gist create -f $ttll - '
############################################
#### SSH ###################################
############################################
#### ANTS ##################################
#alias ali='micro /ants/alias.sh && read -t2 -n1 -ep "update /ants/alias.sh? " ab && source /ants/alias.sh'ions.sh'
alias uu='sudo apt update && sudo apt upgrade -y && sudo apt -y autoremove; sudo apt full-upgrade -y && sudo snap refresh && jp2a /boot/grub/tard.jpg|pv --rate-limit=2222 --quiet'
alias rb='sudo wall "gg"; sleep 1; sudo systemctl reboot'
##
alias www="www-browser"
############################################
#### WEATHER ###############################
# vv='curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%f'
alias vvvv='curl http://wttr.in/stockholm '
alias vv='tput sc; tput cup 4 $((COLUMNS-28)) el; tput cup 5 $((COLUMNS-28)) el; tput cuf 2; 
curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++; tput cup 6 $((COLUMNS-28)) el; tput sgr0 rc'
#curl http://wttr.in/Stockholm?format=%l:+%c%t+-+%C++-++Feels+like:+%f++H:+%h; 
############################################
## MISC_STUFF ##############################
alias fill='seq -s " _ " 2222'
alias info_tput='less /ants/sh/info/tputhelp.txt'
############################################
## RANDOM_STUFF ############################
# export rnd1="(($RANDOM%99))"
# alias rnd1="(shuf 0-222 -n1)"
#alias rr1='(echo $SRANDOM|tail -c2)'
#alias rr2='(echo $RANDOM|tail -c2)'
#alias rrf='tput setaf $(rr1)'
#alias rrb='tput setab $(rr2)'
############################################
#### IP_STUFF ##############################
#alias ports='echo -e "\n\n   $cyan-$re Open ports on local network"$cyan" -"$re" \n"; echo -e " -- -- -- -- -- -- -- $(portsopen;  echo " -- -- -- -- -- -- --")"|column -tLo "$(tput sgr0)|  " -tLo "  $(tput sgr0)||   " -H 1,2,3,4,8; echo -e "\n\n" '
#export ipn="$(hostname -I | tail -c3)"
#export ipnet="$(hostname -I|tr  " " "\n"|head -n1)"
#export ipnet=$(hostname -I|tr " " "\n"|head -n1)
#export ipn=$(hostname -I|tr " " "\n"|head -n1|tail -c2)
#alias iplocal="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'|tr "\n" "-""
#iplocal=$(iplocal|tail -n1)
#alias ipnet="tput setab $ipn; echo -n $ipnet; tput sgr0;"
#alias ippub="wget -qO- ifconfig.me"
#alias ipports="sudo lsof -i -P -n"
##
#alias ipa='echo -ne "
#\t$(rrf)------$(tput setaf 2) Public IP: $(tput sgr0)$(ippub)$(tput setaf 6) 
#\t$(tput setaf $(rr2))---------------------------------- 
#\t$(rrf)------$(tput setaf 4) Network IP: $(tput sgr0)$(iplocal|tr "\n" "\t")$(tput sgr0)"; echo'
############################################

##
# alias ali='psp read -ep "$c2 " -i "alias " "ali"; echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
# alias ali='psp read -ep "$c2 " -i "ali " "ali";
# echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
#alias ali='psp read -ep "$c2 alias name: " "alia"; 
#psp read -ep "$c2 alias $alia=" -i ""'""""'"" "aliq"; 
#echo "alias $alia=$aliq" >> /ants/alias.sh; 
#echo -e "\n $alia=""$aliq"" \n "; source /ants/alias.sh'
############################################
############################################
#alias fakta='neofetch 2>/dev/null '
#alias gg='tput indn 8 cuu 4; read -ep "$c2 " -i "google: " "google"; googler "https://www.google.com/search?q=$google"'
alias zz="ranger 2>/dev/null" 
#alias pp='echo ____pinging_moto8____; for i in {1..18}; do sleep 1; 
#kdeconnect-cli -n "moto g(8)" --ping-msg "  >_<  "; sleep 1; done'
alias pp='echo -e "\n\n\n\n"; tput cuu 2; echo -ne "\t $c2 goto: "; read -ep "" -i "$PWD/" "pwd"; cd $pwd; ll; echo;';
alias cloner='
psp read -ep "$c2 "$rev"clone where folder?$re " -i "$PWD/" "folder"; mkdir -p $folder -m 775 2>/dev/null; 
chown "$SUDO_USER":"$USER" "$folder"; cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ll -caklup;
####
psp read -ep "$c2 CLONE: https://github.com/12ants/" -i "" "clone"; 
git clone https://github.com/12ants/$clone; cd $clone 2>/dev/null; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ls -a; echo;echo; '
# alias ww='ee;ee "$cyan";w;ee;ee "$blue"; ps all;ee "$re $PWD"'
alias logins='echo;echo "  LAST LOGINS";echo;sudo lastb -axdwn 4;echo;echo "       = = = = = = == ";echo; sudo last -wxdFan4;echo;landscape-sysinfo; echo;echo "    = = = = = =   ";echo'
alias gt='read -n1 -ep "  $c2  g/t  $(systemctl get-default)  " "gt"; if [ $gt == t ]; then sudo systemctl set-default multi-user.target; else sudo systemctl set-default graphical.target; fi ; echo gg'
alias xxxx='startx'
#alias an12='bash <(wget -O- dub.sh/ants12)'
#alias aeniks='wget -Ok dub.sh/aeniks; . k;'
alias greet='echo -ne "\t$c2 Welcome back $darkblue $USER,$re today is:$blue "; date; echo'
alias admins='if [ -e != /etc/sudoers.d/admins ]; then sudo touch /etc/sudoers.d/admins; fi; 
sudo chmod 775 /etc/sudoers.d/admins && 
read -ep " $c2 Add as admin-user: " "newsudo" && sudo echo -e "
$newsudo ALL=(ALL) NOPASSWD:ALL
%"$newsudo" ALL=(ALL) NOPASSWD:ALL \n" >> "/etc/sudoers.d/admins"'
####
alias uuuu='cd /uuuu; echo; pwd|pr --omit-header --indent=4|lolcat -p 2; echo;  echo -e "$cyan$dim --------$re"; ls -Alhkct; echo -e "$cyan$dim --------$re \n"'
if [ -x /usr/games/cowsay ]; then cows=($(ls /usr/share/cowsay/cows|sed s/.cow//g)); fi; 
alias qw="/usr/games/fortune"
alias push='git add -A; git commit --amend -m $(date +%F_%H_%M); git push'
alias pull='git pull --autostash'
alias info_cm'=less /ants/sh/info/cmd.sh'
alias cm2'=cat /ants/sh/cmd.sh'
alias yno='read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo yes; fi;'
