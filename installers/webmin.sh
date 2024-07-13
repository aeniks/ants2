#!/bin/bash
######## webmin


## About: Webmin Installer.
##
echo -e "\n\n  $green #######################$re "
echo -e "  $green ##$re WEBMINSTALLER$green ######$re "
echo -e "  $green #######################$re "
echo -e "  $green ##$re "
echo -e "$c2 Installing Webmin . . ."\n\n ; tput dim;
apt install -y perl libnet-ssleay-perl openssl \
libauthen-pam-perl libpam-runtime libio-pty-perl 2>/dev/null ; 
tput indn 22; tput cuu 8;
##
# cd $ghh; curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/# master/setup-repos.sh; chmod +x setup-repos.sh; sh setup-repos.sh;
# apt update; apt -y install webmin --install-recommends;
# cp $ghh/0000/conf/webmin.css 
# cd $ghh/0000; echo "$re$c2 Webmin installed !  . . ."; tput sgr0;
# echo -e "\n\n\t $green##$re"
# echo -e "\t $green#######################$re"
# echo -e "\t $green##$re WEBMIN - DONE$green ######$re"
# echo -e "\t $green#######################$re"
# echo -e "\n\n\t $green##$re \n\n"
##
cd /tmp; 
wget -OO.tar.gz https://download.webmin.com/devel/tarballs/webmin-current.tar.gz; 
tar -xf O.tar.gz --strip-components=1;
# cp $ghh/0000/conf/webminsetup.sh ./setup.sh -b;
./setup.sh /usr/local/webmin 
echo gg
##
##
