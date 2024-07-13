#!/bin/bash
#description:   Menu which allows multiple items to be selected
#usage:         ./menu.sh
#Menu opt
unset opt choices i NUM sel ACTIONS
ops() {
opt=($(ls $1))
}
ops
confirm() {
for i in ${!opt[@]}; do 
if [[ ${choices[$i]} ]]; then
#Option 2 selected
echo "Option $((i+1)) selected"
fi
done
}
#Variables
ERROR=" "
#Clear screen for menu
tput indn $((LINES-6)); tput cup 6;
#clear
#Menu function
MENU() {
echo -e "\t$c2 hello"
for NUM in ${!opt[@]}; do
echo "[""${choices[NUM]:- }""]" $(( NUM+1 ))") ${opt[NUM]}"
done
echo "$ERROR"
}
#Menu loop
while MENU && read -e -p "Select the desired opt using their number 
(again to uncheck, ENTER when done): " -n1 sel && [[ -n "$sel" ]]; do
tput cup 6
if [[ "$sel" == *[[:digit:]]* && $sel -ge 1 && $sel -le ${#opt[@]} ]]; then
(( sel-- ))
if [[ "${choices[sel]}" == "+" ]]; then
choices[sel]=""
else
choices[sel]="+"
fi
ERROR=""
else
ERROR="Invalid option: $sel"
fi
done
confirm
