for i in {1..22}; do tput indn $LINES; tput cup $((RANDOM%2+44)); heyo | pr --omit-header --indent=$((RANDOM%4+88)) | lolcat -p 22 -F .06; sleep 12; done
