#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then echo "cant be root"; exit; fi;
read -ep "name for key: " "githubs";
read -ep "gh email: " -i "ll@12ants.com" "ghmail";
echo 'Host *
   ForwardAgent yes
' >> ~/.ssh/config;

ssh-keygen -C $ghmail  chmod 600 ~/.ssh/$githubs; 
eval "$(ssh-agent -s)"; 
ssh-add ~/.ssh/$githubs;
gh ssh-key add id_ed25519.pub --type authentication --title $githubs;
sudo systemctl restart ssh;
ssh -T git@github.com;
