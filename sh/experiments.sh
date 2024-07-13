
qa() { 
tput setaf $((RANDOM%$1+$2)); 
}
ex1() { 
for i in {0..88}; do 
sleep .1; tput sc; 
echo -ne "$(tput cup $((LINES/2-RANDOM%LINES/4)) $((RANDOM%COLUMNS/4)))$re    $(qa $ra1 $ra2)
\b\b\b\b    $re$(tput cnorm rc)"; done } 
