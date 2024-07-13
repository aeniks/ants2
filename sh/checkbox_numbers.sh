#!/bin/bash
## Menu which allows multiple items to be selected
unset opt choices i NUM sel ACTIONS err
ops() {
opt=($(ls $1))
}
ops
for i in $(seq $((LINES-4))); do echo; done;
echo -ne "\e[2f\e[0J\e[6f"
## MENU FUNCTION ####
echo -ne " Select the desired option using their number 
 ("$dim"again to uncheck,$re ENTER$dim when done"$re"): \n\n\e[s";
MENU() {
for NUM in ${!opt[@]}; do
echo " [""${choices[NUM]:- }""]" $(( NUM+1 ))") ${opt[NUM]}";
done; echo "$err"
}
## MENU LOOP ########
while MENU && read -ep "" -n1 sel && [[ -n "$sel" ]]; do echo -ne "\e[u";
if [[ "$sel" == *[[:digit:]]* && $sel -ge 1 && $sel -le ${#opt[@]} ]]; 
then (( sel-- )); if [[ "${choices[sel]}" == "+" ]]; then
choices[sel]=""; else choices[sel]="+"; fi; 
err=""; else err="$(echo -ne "Invalid option: $sel"; read -t.1)"
fi; done; 
## CONFIRMATION #####
for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
then echo -e " Option $((i+1)) selected"; fi; done;
echo -ne "\n Are these choices correct?"; 
read -n1 -p "$re$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo " Ok"; 
for kl in ${!choices[*]}; do . ${opt[kl]}; done; fi; echo;
#####################


