## pro - task loaading animation
pro() {
alias tf='tput setaf $((RANDOM%16));'
alias tb='tput setab $((RANDOM%16));'
c2="$cyan --$re"; tput civis;
$1 $2 $3 $4 $pro &>/dev/null & disown; 
#tput cuu 8; tput ed; tput cud 2; 
PROC_ID=$!; 
while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)==$re      ]" \
"[$(tf)===$re     ]" "[$(tf)====    $re]"  "[ $(tf)====   $re]" \
"[  $(tf)====$re  ]" "[   $(tf)==== $re]" "[    $(tf)====$re]" \
"[     "$(tf)"===$re]" "[      "$(tf)"=="$re"]" "[       =]" "[        ]" \
"[        ]" "[        ]"; 
do echo -e "  [$(tb)  $re]$c2 Executing $rev $1 $2$3$4$pro $re"$c2" $X"; tput cuu1; sleep 0.08; done; done;
echo -e "\t\t\t\t\t\t [  "$green"DONE"$re"  ] \n"; tput cnorm;
}
########
yno() {
## FIRST LINE IS FOR NO QUESTION
if [ -z "$1" ]; then echo -e "\n\t $c2 Try$dim ["$re"yno question? command 1"$dim"]$re and use quotes...\n"; fi;
########################################################################################################
echo -e "\t$re$c2 $1 $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)";  read -n1 yn; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t$c2 OK"; pro $2; else echo "nope"; fi;  
}

yno "ha ha" "kk kk"
