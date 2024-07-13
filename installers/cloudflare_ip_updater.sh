#!/bin/bash 
sudo apt -y install git python3.10-venv python3-pip 2>/dev/null;
read -ep  "		$c2 gh folder: " -i "$PWD/" "gh"; 
export gh=$gh; cd $gh; sudo rm cloudflare-ddns -R 2>/dev/null; 
git clone https://github.com/timothymiller/cloudflare-ddns.git;
cd cloudflare-ddns; 
read -ep "$c2 download https://github.com/aeniks/ants/raw/main/sh/cf_dns.gpg ? "; "dldl"
wget -O config.gpg https://github.com/aeniks/ants/raw/main/sh/cf_dns.gpg
gpg -o config.json -d config.gpg; 
sudo chmod +x *; 
echo '#!/bin/bash 
bash $gh/cloudflare_dns/start-sync.sh' > "cfip.sh"; 
if [ $UID = 0 ]; then sudo chown $SUDO_USER cfip.sh; sudo chmod 775 cfip.sh;
else sudo chown $USER cfip.sh; sudo chmod 775 cfip.sh;
fi 
sudo cp cfip.sh	/etc/cron.hourly/cloudflare_ip.sh;
echo -e "\t $c2 CONFIG-FILE in $cyan$gh/config.json$re \n\t $c2 CRON FILE in $cyan /etc/cron.hourly/cloudflare_ip.sh $re";