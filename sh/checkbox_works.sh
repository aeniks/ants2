#!/bin/bash
## Multiselection menu for bash
echo -e "\n  ------------------------------------------
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
prompt_for_multiselect () {
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
if [[ $key = "a"      ]]; then echo a; fi;
if [[ $key = ""      ]]; then echo enter; fi;
if [[ $key = $'\x20' ]]; then echo space; fi;
if [[ $key = $'\x1b' ]]; then
read -rsn2 key
if [[ $key = [A ]]; then echo up;    fi;
if [[ $key = [B ]]; then echo down;  fi;
if [[ $key = [C ]]; then echo a;  fi;
if [[ $key = [a ]]; then echo a;  fi;
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
local lastrow=`get_cursor_row`; local startrow=$(($lastrow - ${#options[@]}))
# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off
local active=0
while true; do
# print options by overwriting the last lines
local idx=0
for option in "${options[@]}"; do local prefix="    [ ]";
if [[ ${selected[idx]} == true ]]; then prefix="    [$gre*$re]"; fi
cursor_to $(($startrow + $idx))
if [ $idx -eq $active ]; then print_active "$option" "$prefix"
else print_inactive "$option" "$prefix"; fi
((idx++))
done
# user key control
case `key_input` in
a)		toggle_option ;;
space)  toggle_option selected $active;;
enter)  break;;
q)		exit;;
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
ov1=($(ls $PWD/$1))
OPTIONS_VALUES=(${ov1[@]^^})
#OPTIONS_VALUES=(${ov2[@]//.*/ })
##################################################
##
OPTIONS_LABELS=("Apple" "Microsoft" "Google")
##
for i in "${!OPTIONS_VALUES[@]}"; do OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"; done;
prompt_for_multiselect SELECTED "$OPTIONS_STRING"
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
do echo -e "\t $c2 Installing $i"; sleep 1; done
echo -e "done"
