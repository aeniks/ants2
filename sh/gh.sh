#!/bin/bash
if [ -e != /bin/gh ]; then sudo apt -y install gh; fi; 
echo -e "\n\t $c2 Authorize aeniks gh? "; read -ep " " "a"; 
sudo chmod 775 *; 
gpg -o /ants/sh/gh.txt -d /ants/sh/gh.gpg;
gh auth login --with-token < '/ants/sh/gh.txt'
echo ok; rm gh.txt; gh auth status;
