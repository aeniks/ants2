#!/bin/bash
## Multiselection menu for bash
check() {
size=($(stty size)); for i in $(seq $size); do echo; done; echo -ne '\e[s\e[H\e[J'; 
gre='\e[92m'; re='\e[0m'; dim='\e[2m'; bold='\e[1m'; c2='\e[36m--\e[0m'
echo -e "
  ------------------------------------------
  ------------ $gre hello $re ---------------------
  ------------------------------------------
  --$dim Choose:  [$re Up / Down$dim ]$re
  --$dim Select:  [$re Space$dim ]$re
  --$dim Confirm: [$re Enter$dim ]$re
  ------------------------------------------
  -- Choose multiple options: --------------
  ------------------------------------------\n"
unset OPTIONS_VALUES OPTIONS_STRING SELECTED CHECKED OPTIONS_LABELS
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
if [[ $key = "" ]]; then echo enter; fi;  if [[ $key = "q" ]]; then echo q; fi; 
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
for option in "${options[@]}"; do  prefix="  [ ]";
if [[ ${selected[idx]} == true ]]; then prefix="  [$gre*$re]"; fi
cursor_to $(($startrow + $idx))
if [ $idx -eq $active ]; then print_active "$option" "$prefix"
else print_inactive "$option" "$prefix"; fi
((idx++))
done
# user key control
case `key_input` in
space)  toggle_option selected $active;;
enter)  break;;
q) return 0;;
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
if [[ $1 ]]; then ov1=($1); else
ov1=($(ls $PWD/$1)); fi; 
OPTIONS_VALUES=(${ov1[@]^^})
#OPTIONS_LABELS=("Apple" "Microsoft" "Google")
for i in "${!OPTIONS_VALUES[@]}"; do OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"; done;
checkbox SELECTED "$OPTIONS_STRING"; ######## << call functions
for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; 
then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
echo -e "  \e[4;36mYou chose:\e[0m ${CHECKED[@]/#/\\n"  "}";
echo -ne "\n  $c2 Do you wish to proceed? \e[2m[\e[0mY\e[2m/\e[0mn\e[2m] \e[0m "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then echo -e "\n  Nope\n"; 
return 0 2>/dev/null; break 2>/dev/null; else echo -e "\n  $c2 OK"; for i in "${CHECKED[@],,}"; 
do echo -e "  $c2 Installing $i"; sleep 1; done; echo -e "\n  Done"; fi; echo -e "\e[0m";
}
