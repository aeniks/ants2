for i in {1..2222}; do tput cup $((RANDOM%LINES)) $((RANDOM%COLUMNS)) setab $((RANDOM%222/2+22/2+22/2+RANDOM%122)); echo -n "  "; done 
