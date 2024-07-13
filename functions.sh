#!/bin/bash
###########
## /ants/functions.sh - functions for bash shell
###########
###########
## coolors - display available colors
####
gg() {
if [ $1 ]; then
gg="$1 $2 $3 $4 $5 $6";
googler "$gg";
else
tput indn 8 cuu 4; 
read -ep "$c2 google: " "gg"; 
googler "$gg";
fi
}
ssl() {
s1="ants.ftp.sh"
s2="ants.swe.net"
s3="aeniks.mooo.com"
s4="bobo.ftp.sh"
echo -n "$cyan 1$re) "; host $s1; 
echo -n "$cyan 2$re) "; host $s2; 
echo -n "$cyan 3$re) "; host $s3; 
echo -n "$cyan 4$re) "; host $s4; 
echo -en "\n\t$c2 server: "; read a
echo -en "\t$c2 user: "; read -ep "" -i "$USER" "shuser";
echo -en "\t$c2 port:"; read -ep " " -i "22" "sp";
        case $a in
	        1) ssh $shuser@$s1 -p $sp; return 0 ;;
	        2) ssh $shuser@$s2 -p $sp; return 0 ;;
	        3) ssh $shuser@$s3 -p $sp; return 0 ;;
	        4) ssh $shuser@$s4 -p $sp; return 0 ;;
		0) return 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
#!/bin/bash
## Menu which allows multiple items to be selected
#menu() {
#dim=$(echo -e "\e[2m"); green=$(echo -e "\e[32m"); re=$(echo -e "\e[0m"); hide=$(echo -e "\e[8m");
#line="$dim---------------------------"; dots="$dim.............."
#unset opt choices i nm sel ACTIONS err cole; opt=($(ls -p1|grep -v /|head -n9))
#for i in $(seq $((LINES-2))); do echo; done; echo -ne "\e[2f\e[0J\e[2f"
### BEFORE TEXT ######
#echo -ne " $line\n ------$re BASH$dim-"$re"SELECTOR$dim ------\n $line$re
# ["$dim"1"$re"-"$dim"9"$re"] select/unselect ["$dim"a"$re"] select/unselect all
# ["$dim"ENTER"$re"] confirm ["$dim"q"$re"] exit \n $line$re\n\e[s";
### MENU FUNCTION ####
#MENU() {
#cole=$(stty size|tr " " "\n"|tail -n1)
#for nm in ${!opt[@]}; do echo -e " ($dim$((nm+1))$re) ["$green"${choices[nm]:- }"$re"]"" \
#$(echo ${opt[nm]}|head -c28) $dots\e[29G\e[1D $dim$(sed -n 2p ${opt[nm]}\
#|tr -d '\\'|pr -t -c1 -w$((cole-40)))$re"; done; echo "$err";
#}
### MENU LOOP ########
#echo -ne "\e[?25l"; while MENU && read -en1 -p "$(echo -e "$hide")" sel && [[ -n "$sel" ]]; 
#do echo -ne "$hide\e[u"; if [[ "$sel" == *[[:digit:]]* && $sel -ge 1 && $sel -le ${#opt[@]} ]]; 
#then (( sel-- )); if [[ "${choices[sel]}" == "+" ]]; then choices[sel]=""; 
#else choices[sel]="+"; fi; err=""; fi; if [ $sel == a ]; 
#then if [ -z $choices ]; then unset choices; for i in ${!opt[@]}; 
#do choices+=(+); done; else unset choices; fi; fi; 
#if [ $sel == q ]; then echo -e "\n\e[?25h\e[0m"; 
#echo -e "\n\n\n\n\n\n\n\n\n\n\n gg\n\n"; return 0; fi; done;
### CONFIRMATION #####
#for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
#then echo -e "$re Option $((i+1)) ($dim${opt[i]}$re) selected"; fi; done;
#echo -ne "\n$re Are these choices correct?$re$dim ["$re"Y$dim/"$re"n"$dim"]$re"; 
#read -en1 "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo -e "\n\n Ok\e[?25h\e[0m"; 
#for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
#then echo -e "\n Installing: $dim${opt[i]}$re"; source ${opt[i]}; 
#echo -e "$green DONE$re"; fi; done; fi; echo -e "\n\e[?25h\e[0m";
#}

send () {
echo -ne "  $c2 File to send:"; if [ $1 ]; then read -rep " " -i "$1" "send"; 
else read -rep " " -i "$PWD" "send"; fi; ft=$(file $send --brief)
echo -ne "\n  $c2 Send: $gre$ft$re $underline$bold$send$re$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re"; 
read -n1 -p " " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then 
echo oo; if [ $ft = "directory" ]; then 
rsync -vPzha -e 'ssh -p 44444' $send uuuu@ants.ftp.sh:/uuuu/backup/send/ --mkpath \
|tee -a ~/rsync_log.sh & 
else rsync -vPzh -e 'ssh -p 44444' $send uuuu@ants.ftp.sh:/uuuu/backup/send/ --mkpath \
|tee -a ~/rsync_log.sh &
fi; tail ~/rsync_log.sh -n 4; fi; echo; 
}

ports() {
if [ $1 ]; then ho="$1"; h2="$(host $ho|tr -d "[:alpha:] "|tail -c+3)";
else h2="localhost"; fi; 
nc -z -v $h2 1-65535 2>&1 | grep succeeded
}



cdcd() {
l -d */; psp read -ep "$c2 "$rev"goto:$re " -i "$PWD" "goto"; 
mkdir -p $folder -m 775 2>/dev/null;
cd $goto; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;
}

####



ipsnet() {
ipsnet=($(ip n | grep -v FAILED|tr -s "[:alpha:]" "\t"|cut -c1-11|head -n-1|tr -d "\n\t")); 
echo ${ipsnet[@]}
}

#  for i in ${ipsnet[@]}; do nc -N $i 22 -w1 -v||(tput setaf 1 cuu1; echo -e " NO $re";) done



ipnet() {
iplocal=$(ifconfig|grep "4163" -n1|tail -n1|cut -c16-29|tr -d " [:alpha:]"); 
ipbase=${iplocal%.*}; echo $ipbase
for ip in $ipbase.{1..54}; do
ping -c 1 -W 1 $ip &
done | sed -nE 's:^.* from ([0-9.]+).*time=(.*s)$:\1 (\2):p'
wait
}

#scan()
#{
#
#baseip=$(arp -a) && baseip=${baseip%%\)*} && baseip=${baseip##*\(}
#baseip=$(ip -o -f inet addr show|grep "scope global") && \
#baseip=${baseip##* inet} && baseip=${baseip%%/*}; baseip=${baseip%.*}
#echo $baseip
#
#for ip in $baseip.{1..54}; do
#ping -c 1 -W 1 $ip &
#done | sed -nE 's:^.* from ([0-9.]+).*time=(.*s)$:\1 (\2):p'
#wait
#fi
#}

# if [ $1 ]; then
# for baseip; do
# scan $baseip
# done
# else
# baseip=$(arp -a) && \
# baseip=${baseip%%\)*} && baseip=${baseip##*\(}
# if [ $baseip"" == "" ] ; then
# baseip=$(ip -o -f inet addr show|grep "scope global") && \
# baseip=${baseip##* inet} && baseip=${baseip%%/*}
# fi
# baseip=${baseip%.*}
# scan $baseip 
# fi

coolors() {
#!/bin/bash
for ((i=0; i<256; i++)) ;do
echo -n '  '
tput setab $i
tput setaf $(( ( (i>231&&i<244 ) || ( (i<17)&& (i%8<2)) ||
(i>16&&i<232)&& ((i-16)%6 <(i<100?3:2) ) && ((i-16)%36<15) )?7:16))
printf " C %03d " $i
tput op
(( ((i<16||i>231) && ((i+1)%8==0)) || ((i>16&&i<232)&& ((i-15)%6==0)) )) &&
printf " " ''
done
echo;echo;
}
###########
## sup - show basic info
sup() {
echo -e "\n\t $redb running: $re$gray";
sudo w -o;
echo -e "\n\t $yellowb running-processess: $re$gray";
sudo ps -la
echo -e "\n\t$blueb login-attempts: $re$gray";
sudo lastb -an8
echo -e "\n\t $cyanb login-users: $re$gray";
sudo last -an8
echo -e "\n$re";
}
#cmd() {
#cat /ants/cmd.sh|shuf -n1;
#read -ep "$c2 new cmd: " "cmd"
#echo -e "$cmd"; >> "/ants/cmd.sh";
#}
###########
## timer - countdown
klockan () { while true; do tput sc; tput cup 0 $((COLUMNS - 42)); tput setaf $(echo $LINENO) 2>/dev/null; date +%F%t$(tput setaf $(date +%u))%A$(tput setaf $(date +%S))%t%R:%S; tput rc; sleep 1; done& } 

timer() {
#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'
hour=0
min=0
sec=22
pppp pppp pppp pppp 
read -ep "$c2 Hours: " -i "$hour" "hour";
read -ep  "$up1$c2 Minutes: " -i "$min" "min";
read -ep  "$up1$c2 Seconds: " -i "$sec" "sec";
echo -ne "$up1";
tput civis
echo -ne "${GREEN}"
while [ $hour -ge 0 ]; do
while [ $min -ge 0 ]; do
while [ $sec -ge 0 ]; do
if [ "$hour" -eq "0" ] && [ "$min" -eq "0" ]; then
echo -ne "${YELLOW}"
fi
if [ "$hour" -eq "0" ] && [ "$min" -eq "0" ] && [ "$sec" -le "10" ]; then
echo -ne "${RED}"
fi
echo -ne "                $(printf "%02d" $hour):$(printf "%02d" $min):$(printf "%02d" $sec)\033[0K\r"
let "sec=sec-1"
sleep 1
done
sec=59
let "min=min-1"
done
min=59
let "hour=hour-1"
done
echo -e "${RESET}"
tput cnorm
}
###########
## db_new - create new mysql database
dbnew() {
#!/bin/bash
## new_db
##
d1="$(date +%h%d%y-%S)"; read -ep "$c2 DB User: " -i "$SUDO_USER" "dbu" ; read -ep "$c2 New DB: " -i "$d1" "d1"; echo -e "\n $green $d1 $re";
sudo mysql -e"CREATE USER $dbu;flush privileges;SHOW DATABASES;";
sudo mysql -u $dbu -p -e"CREATE DATABASE IF NOT EXISTS $d1;flush privileges;SHOW DATABASES;";
echo -e "\n $cyan $d1 $re \n\n";
##
##
}
###########
###########
## wotd - word of the day
wotd() {
RANDOMWORD=($(cat /usr/share/dict/words))
woord=$(echo ${RANDOMWORD[$((RANDOM%${#RANDOMWORD[@]}))]})
echo $woord|tr -d "''";
}
###########
## loginscreen - change default login screen
loginscreen() {
sudo systemctl enable multi-user.target 2>/dev/null;
read -n1 -ep "$c2 Choose default login mode: [G]/[T]" lsls
if [ $lsls == g ]; then 
sudo systemctl set-default graphical.target
else sudo systemctl set-default multi-user.target
fi
}
###########
## pro - task loaading animation
pro() {
####
alias tf='tput setaf $((RANDOM%16));'
alias tb='tput setab $((RANDOM%16));'
c2="$cyan --$re"; tput civis;
$1 $2 $3 $4 $5 $6 $pro &>/dev/null & disown; tput cuu 8; tput ed; tput cud 2; PROC_ID=$!; while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)==$re      ]" "[$(tf)===$re     ]" "[$(tf)====    $re]"  "[ $(tf)====   $re]" \
"[  $(tf)====$re  ]" "[   $(tf)==== $re]" "[    $(tf)====$re]" "[     "$(tf)"===$re]" "[      "$(tf)"=="$re"]" "[       =]" "[        ]" "[        ]" "[        ]"; 
do echo -e "  [$(tb)  $re]$c2 Executing $rev $1 $2 $3 $4 $pro $re"$c2" $X"; tput cuu1; sleep 0.08; done; done;
echo -e "\t\t\t\t\t\t [  "$green"DONE"$re"  ] \n\n\n\n\n"; tput cnorm;
}
###########
## show loaded state
#yno() {
#if [ -z "$1" ]; 
#then echo -e "\n\t $c2 Try$dim ["$re"yno question? command 1"$dim"]$re and use quotes...\n"; fi; 
#echo -e "\n\n\t $re$c2 $1 $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)\n\n\n\n"; 
#tput rc cuu 5; read -n1 yn; 
#if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t $c2 OK"; pro $2 $3 $4 $5 ; else echo "nope"; fi;  
#}
zzzz() { 
for i in {1..22}; do 
tput indn $LINES; tput civis; 
tput cup $((RANDOM%$LINES-12)); 
fortune|/usr/games/fortune|/usr/games/cowthink -f ${cows[$((RANDOM%${#cows[@]}))]}|pr --omit-header --indent="$((RANDOM%COLUMNS*8/6))"|lolcat -s 222 -p 666 -a; 
tput cnorm; tput cup 0; sleep 4;
done; 
}
own() {
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own /ants/"; sudo chown $SUDO_USER:ants /ants -R; sudo chmod 775 /ants -R;
else echo -e "\t $USER own /ants/"; sudo chown $USER:ants /ants -R; sudo chmod 775 /ants -R; 
fi;
}
owns() {
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own /home/$SUDO_USER"; sudo chown $SUDO_USER:ants /home/$SUDO_USER -R; sudo chmod 775 /home/$SUDO_USER  -R;
else echo -e "\t $USER own/home/$USER"; sudo chown $USER:ants /home/$USER -R; sudo chmod 775/home/$USER -R; 
fi;
}
qqqq() {
sudo chmod 775 /gh/qqqq -R; sudo chown aa /gh/qqqq -R; cd /gh/qqqq/; git pull; ls -Atlcr;
pp=$(pwd); read -ep " $c2 create? " -i "/gh/qqqq/$(wotd|tr -s "[:upper:]" "[:lower:]"|tr -d "' '").txt" "qaqa";
micro $qaqa; cd /gh/qqqq/; git add -A; git commit -a -m $(wotd); git pull; git push; cd $pp; ls -Altr; sudo chmod 775 /gh/qqqq -R;
}
githubs() {
sudo apt -y install git gh 2>/dev/null;
qq="Auth Github";
echo -e "\n\n\t $re$c2 $qq $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)\n\n\n\n"; read -n1 yn; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t $c2 OK"; 
gpg -o /tmp/gh.txt -d /ants/sh/gh.gpg;
gh auth login --with-token < /tmp/gh.txt;
gh auth status; echo; rm /tmp/gh.txt;
gh config set git_protocol ssh;
##
read -ep "gh email: " -i "hello@aeniks.com" "ghmail";
read -ep "gh name: " -i "aeniks" "ghname";
git config --global user.email $ghmail
git config --global user.name $ghname
else echo " nope "; fi; echo ok;
##
##
sudo cp /ants/sh/aa.gpg /ants/sh/aa.pub ~/.ssh/;
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own ~/.ssh"; 
sudo chown $SUDO_USER:ants ~/.ssh -R; sudo chmod 775 /gh/qqqq -R;
else echo -e "\t $USER ~/.ssh"; 
sudo chown $USER:ants ~/.ssh -R; sudo chmod 775 /gh/qqqq -R; 
fi; 
####
sudo chmod 775 ~/.ssh/aa.pub; sudo chmod 600 ~/.ssh/aa.gpg;
gpg -o ~/.ssh/aa.key -d ~/.ssh/aa.gpg;
sudo chmod 600 ~/.ssh/aa.key;
ssh-add ~/.ssh/aa.key;
}

githut() {
sshp=$(wotd|tr -d "''"|tr "[:upper:]" "[:lower:]"); 
ssh-keygen -f $HOME/.ssh/$sshp -N ""; 
gh ssh-key add "$HOME/.ssh/$sshp.pub"
ssh-add $HOME/.ssh/$sshp;
}


mkv() {
echo -e "\n\t $c2 convert $green$(find -iname *.mkv)$re to *.mp4?: "; read; 
for i in $(find -iname *.mkv); do
ffmpeg -i "$i" -codec copy "${i%.*}.mp4"; rm $i; 
done
}
owset() {
cd /home;
read -ep "$c2 Update rights on $(ls)" "yy";
for i in $(ls);
do sudo chown $i: $i -R; done; 
}
popo() {
echo -ne "\n$(ls|tail -n8) \n\t$c2 Choose file to upload: "; read -ep "" -i "$PWD/" popo;
sudo cp "$popo" /gh/qqqq/; sudo chown aa:ants /gh/qqqq -R; 
sudo chmod 775 /gh/qqqq -R; sudo chown aa /gh/qqqq -R; cd /gh/qqqq/; 
ls * -Atrhsw1; 
pp=$(pwd); read -ep " $c2 create? " -i "/gh/qqqq/$(ls -Atrw1|tail -n 1)" "qaqa";
cd /gh/qqqq/; git add -A; git commit -a -m "added $qaqa"; 
git pull; git push; 
cd $pp; ls -Atrlhkw1; sudo chmod 775 /gh/qqqq -R;
echo -e "\n\t$c2 Visit:$cyan https://github.com/aeniks/qqqq/raw/main/$(ls * -Atrw1|tail -n1)\n\n"
}
## Multiselection menu for bash
mmmm() {
size=($(stty size)); for i in $(seq $size); do echo; done; echo -ne '\e[s\e[H\e[J'; 
gre='\e[92m'; cyan='\e[36m'; re='\e[0m'; dim='\e[2m'; bold='\e[1m'; c2='\e[36m--\e[0m';
dots="$(for i in $(seq $(($(stty size|tail -c4) - 11))); do echo -ne .; done;)"; 
echo -e "
  ------------ $gre hello $re ----------------------------
  ----$dim Choose:  [$re Up / Down$dim ]$re ----$dim Quit: [$re Q$dim ]$re ----
  ----$dim Confirm: [$re Enter$dim ]$re --$dim Select: [$re Space$dim ]$re ----\n"
unset OPTIONS_VALUES OPTIONS_STRING SELECTED CHECKED OPTIONS_LABELS ov1
####
checkbox () {
# little helpers for terminal print control and key input
ESC=$( printf "\033")
cursor_blink_on()   { printf "$ESC[?25h"; }
cursor_blink_off()  { printf "$ESC[?25l"; }
cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
print_inactive()    { printf "$2   $1 "; }
print_active()      { printf "$2  $ESC[7m $1 $ESC[27m"; }
get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
key_input()         {
local key
IFS= read -rsn1 key 2>/dev/null >&2
if [[ $key = "" ]]; then echo enter; fi;  if [[ $key = "q" ]]; then echo -e "q"; fi; 
if [[ $key = $'\x20' ]]; then echo space; fi; if [[ $key = $'\x1b' ]]; then read -rsn2 key 
if [[ $key = [A ]]; then echo up; fi; if [[ $key = [B ]]; then echo down; fi; fi; 
}
sel_all () {
for i in "${!options[@]}"; do  selected+=("${options[$i]}");  done;
} 
toggle_option()    {
arr_name=$1
eval " arr=(\"\${${arr_name}[@]}\")"
option=$2
if [[ ${arr[option]} == true ]]; then
arr[option]=
else
arr[option]=true
fi
eval $arr_name='("${arr[@]}")'
}
retval=$1
IFS=';' read -r -a options <<< "$2"
if [[ -z $3 ]]; then
unset defaults
else
IFS=' ' read -r -a defaults <<< "$3"
fi
selected=()
for ((i=0; i<${#options[@]}; i++)); do
selected+=("${defaults[i]:-false}")
printf "\n"
done
# determine current screen position for overwriting the options
lastrow=`get_cursor_row`;  startrow=$(($lastrow - ${#options[@]}))
# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off
active=0
while true; do
# print options by overwriting the last lines
idx=0
for option in "${options[@]}"; do  prefix="\e[0m  [ ]";
if [[ ${selected[idx]} == true ]]; then prefix="\e[0m  [$gre*$re]"; fi
cursor_to $(($startrow + $idx))
if [ $idx -eq $active ]; then print_active "$option" "$prefix"
else print_inactive "$option" "$prefix"; fi
((idx++))
done
# user key control
case `key_input` in
space)  toggle_option selected $active;;
enter)  break;;
q) echo -e "\e[?25h"; return 0;;
up)     ((active--));
if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
down)   ((active++));
if [ $active -ge ${#options[@]} ]; then active=0; fi;;
esac
done
# cursor position back to normal
cursor_to $lastrow
echo
cursor_blink_on
eval $retval='("${selected[@]}")'
}
if [[ $1 ]]; then OPTIONS_VALUES=($1); else
OPTIONS_VALUES=($(ls $PWD/$1)); 
fi; 
for i in ${OPTIONS_VALUES[@]}; do ft=$(file $i --mime-type -b|head -c4); if [[ $ft == "text" ]]; then
OPTIONS_LABELS+=("\e[2m $(sed -n 2p $i|tr -s ';()\\' ' '|cut -c-68) "); else 
OPTIONS_LABELS+=("\e[2m $(file -b $i|cut -c-44) "); fi
done;
#for i in $ov1; do 
#OPTIONS_VALUES=(${ov1[@]^^})
#done
for i in "${!OPTIONS_VALUES[@]}"; do OPTIONS_STRING+="$dots\e[9G${OPTIONS_VALUES[$i]} \
\e[29G ${OPTIONS_LABELS[$i]};"; done;
#### after ####################################################
checkbox SELECTED "$OPTIONS_STRING"; ######## << call functions
for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; 
then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
echo -e "  \e[4;36mYou chose:\e[0m ${CHECKED[@]/#/\\n"  "}";
echo -ne "\n  $c2 Do you wish to proceed? \e[2m[\e[0mY\e[2m/\e[0mn\e[2m] \e[0m "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then echo -e "\e[?25h \n  Nope\n"; 
return 0 2>/dev/null; break 2>/dev/null; else echo -e "\n  $c2 OK"; for i in "${CHECKED[@]}"; 
do echo -e "\e[0m  $c2 Installing $i \e[2m"; sleep 1; if [ -z "$2" ]; then bash $i; else $2 $i; fi;  
echo -e "\e[0m  $c2 $i Installed \e[2m"; done; echo -e "\n  Done"; fi; echo -e "\e[0m";
}

gist() {
e='echo -e '; c2=$($e'\e[36m --\e[0m'); cyan=$($e'\e[36m'); green=$($e'\e[32m'); red=$($e'\e[31m'); re=$($e'\e[0m'); 
unset pp; echo -ne " $c2 Create a \n\t\t (${green}1${re})-Public or \n\t\t (${cyan}2${re})-Private gist? "; read -n1 -rep "" "gg";  
if [ $gg == "1" ]; then pp="--public"; fi; if [ -z $1 ]; then menu "*" "gh gist create $pp"; else menu "$1" "gh gist create $pp"; fi; 
} 

gh_login() {
gpg -qd /ants/sh/info/gh_aeniks.gpg|gh auth login --with-token; gh auth status; 
}
