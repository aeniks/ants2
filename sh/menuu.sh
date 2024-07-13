#!/bin/bash
mmmm() {
unset kk; if [ -z $1 ]; then 
echo -e "\t $c2 "; read -ep "" -i "$PWD/" "kk"; 
re="$(tput sgr0)"; sc=$(echo $((LINES * COLUMNS))); om="$(for i in $(seq $sc); do echo -ne "."; done)";
else kk=$1; fi; 
# om="$(echo -ne " . . . . . . . . " )";
tput dim cup 0; echo "$om"; tput cup 2 sgr0;
for i in $(ls --color=never $kk); do
echo;
#do echo -e "$om$om\n$om$om\n\n\n"; tput cuu 2; 
echo -ne "\t$i $(tput hpa 42; echo -en " [ "; tput dim; cat $kk$i 2>/dev/null|pr --page-width=42 --omit-header|head -n1|tail -n1 2>/dev/null; tput hpa 86;)$re ] "; 
echo -ne "\t$(tput hpa 42; echo -en " [ "; tput dim;  cat $kk$i 2>/dev/null|pr --page-width=42 --omit-header|head -n2|tail -n1 2>/dev/null; tput hpa 86;)$re ] "; 
done
}
mmmm
