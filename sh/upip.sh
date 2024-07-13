#!/bin/bash
##tput cup 0 ed; echo -ne "\n\n\t $c2 Installation folder:"; read -ep " " -i "$PWD/" "pwd"; 
##OPTION_VALUES=($(echo $pwd/*))
##for i in ${OPTION_VALUES[@]}; do OPTIONS_LABELS+=("$(cat $i|head -c22)"); done 
unset OPTION_VALUES OPTIONS_LABELS
echo -e "\t ------------------------------------------\n\t ------------ $green hello $re ---------------------
\t ------------------------------------------\n\t --$dim Choose:  [$re Up / Down$dim ]$re
\t --$dim Select:  [$re Space$dim ]$re\n\t --$dim Confirm: [$re Enter$dim ]$re
\t ------------------------------------------\n\t -- Choose multiple options: --------------
\t ------------------------------------------"
##
tput cup 0 ed; echo -ne "\n\n\t $c2 Installation folder:"; read -ep " " -i "$PWD/" "pwd"; 
OPTION_VALUES=($(echo $pwd/*))
for i in ${OPTION_VALUES[@]}; do OPTIONS_LABELS+=("$(cat $i|head -c22)"); done 
##
function prompt_for_multiselect () {
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
#for i in ${#OPTIONS_VALUES[@]}; do OPTIONS_LABEL+="$i"; done;
##################################################
##
##
for i in "${!OPTIONS_VALUES[@]}"; 
do OPTIONS_STRING+="${OPTIONS_VALUES[$i]} \t$dim ($re ${OPTIONS_LABELS[$i]}$re );"; done;
prompt_for_multiselect SELECTED "$OPTIONS_STRING"
for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; 
then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
######## CHOOSED
##
echo -e "\t You chose: ${CHECKED[@]/#/"\n\t $c2 "}";
echo -e "\t Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"]$re "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then echo -e "\t $c2 nope"; 
return 2>/dev/null; else echo -e "\t $c2 OK"; fi; 
##
for i in "${CHECKED[@],,}";
do echo -e "\t Installing -- $i -- ... \n"; 
echo -ne "\t"; for i in {1..8}; do tput setaf $((RANDOM%256)); echo -ne "."; sleep .2; done& disown
bash "$pwd/$i"; 
echo -e "\t DONE ... \n"; done
echo -e "\t All done \n";
########################################
################# end
