#!/bin/bash
echo -e "\n\n\t Installing Cloudpanel... \n \n "
read -t11 -ep "    must run clpinstaller as sudo..." "kkkk";
####
apt update && apt -y upgrade && apt -y install curl wget sudo;
####
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "2aefee646f988877a31198e0d84ed30e2ef7a454857b606608a1f0b8eb6ec6b6 install.sh" | \
sha256sum -c && sudo bash install.sh
