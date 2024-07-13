#!/bin/bash
# checkbox menu
tput cup 0; tput ed; unset CHECKED OPTIONS_VALUES OPTIONS_LABELS OPTIONS_STRING
bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) pinkb=$(tput setab 5 bold) c2=""$cyan"--$re";
echo -en "
\t  Installation folder:"; read -ep " " -i "$PWD" ovin; echo -e "
\t  ------------------------------------------
\t  ------------ $green hello $re ---------------------
\t  ------------------------------------------
\t  --$dim Choose:  [$re Up / Down$dim ]$re
\t  --$dim Select:  [$re Space$dim ]$re
\t  --$dim Confirm: [$re Enter$dim ]$re
\t  ------------------------------------------
\t  -- Choose multiple options: --------------
\t  ------------------------------------------\n"
menux () {
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
if [[ $key = ""      ]]; then echo enter; fi;
if [[ $key = $'\x20' ]]; then echo space; fi;
if [[ $key = $'\x1b' ]]; then
read -rsn2 key
if [[ $key = [A ]]; then echo up;    fi;
if [[ $key = [B ]]; then echo down;  fi;
fi
}
toggle_option()    {
local arr_name=$1
eval "local arr=(\"\${${arr_name}[@]}\")"
local option=$2
if [[ ${arr[option]} == true ]]; then
arr[option]=
else
arr[option]=true
fi
eval $arr_name='("${arr[@]}")'
}
local retval=$1
local options
local defaults
IFS=';' read -r -a options <<< "$2"
if [[ -z $3 ]]; then
defaults=()
else
IFS=';' read -r -a defaults <<< "$3"
fi
local selected=()
for ((i=0; i<${#options[@]}; i++)); do
selected+=("${defaults[i]:-false}")
printf "\n"
done
# determine current screen position for overwriting the options
local lastrow=`get_cursor_row`
local startrow=$(($lastrow - ${#options[@]}))
# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off
local active=0
while true; do
# print options by overwriting the last lines
local idx=0
for option in "${options[@]}"; do
local prefix="    [ ]"
if [[ ${selected[idx]} == true ]]; then
prefix="    [$green*$re]"
fi
cursor_to $(($startrow + $idx))
if [ $idx -eq $active ]; then
print_active "$option" "$prefix"
else
print_inactive "$option" "$prefix"
fi
((idx++))
done
# user key control
case `key_input` in
space)  toggle_option selected $active;;
enter)  break;;
up)     ((active--));
if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
down)   ((active++));
if [ $active -ge ${#options[@]} ]; then active=0; fi;;
esac
done
# cursor position back to normal
cursor_to $lastrow
printf "\n"
cursor_blink_on
eval $retval='("${selected[@]}")'
}
######## CONFIGURATION TO INSTALL FOLDER ########
ov1=($(ls))
ov2=(${ov1[@]^})
OPTIONS_VALUES=(${ov2[@]//.*/ })
##################################################
##
## OPTIONS_LABELS=("Apple" "Microsoft" "Google")
##
for i in "${!OPTIONS_VALUES[@]}"; do OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"; done;
#menux SELECTED "$OPTIONS_STRING"

for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
######## CHOOSED
##
echo -e "\n\t You chose: \n\t ${CHECKED[@]/#/"$c2 "}";
echo -ne "\t $c2 Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope"; 
return 0 2>/dev/null; break 2>/dev/null; exit;
else echo -e "\n\t $c2 OK"; fi; 
##
for i in "${CHECKED[@],,}";
do echo -e "\t $c2 Installing $i \n"; 
bash "$ovin/"$i".sh"; echo -e "\t $c2 DONE\n"; done
echo -e "\t $c2 All done\n";
########################################
echo -e "\n\t $c2$blink Bash is now better! $re$c2 \n";
################# end
echo -e "$green"; cd /ants/; cd $OLDPWD
echo -e "\tEnjoy the ants! \n\t"$re$dim"this be the files\n\t$re$blue---------------- $re\n\t "$dim$bold"/"$re"ants$re"; 
echo -e "\t$blue---------------- $re";
ls --group-directories-first --width=2222 -p|pr --omit-header --indent=6
echo -e "\t$blue---------------- $re\n"; 
