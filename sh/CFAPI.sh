#!/bin/bash
## cloudflare ddns for 12ants.com and glowfish.se
newip4=$(curl ip.me -4)
curl ip.me -4
#read -rep "cloudflare global api:" -i "7485ffd444b16c4d4e8fa7c71a420bfa065a9" "globapi"
CFAPI=($(curl GET https://api.cloudflare.com/client/v4/zones \
--header 'Content-Type: application/json' \
--header 'X-Auth-Email: leonljunghorn@gmail.com' \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' -qs \
|tr -s ',":{[' "\n"|grep -G 'active' -B4 --no-group-separator \
|sed  s/name//|tr -s ".\n" "_ ")); 
##
##
echo -e "
option 1 = ${CFAPI[1]} = ${CFAPI[0]}
option 2 = ${CFAPI[5]} = ${CFAPI[4]}";
##
##
zone_id="${CFAPI[0]}"
DNSID=($(curl GET https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records \
--header 'Content-Type: application/json' \
--header 'X-Auth-Email: leonljunghorn@gmail.com' \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' -qs\
|tr -s ',":{[' "\n"|grep "A" -A2 -B9 -x|grep id -x -C1|tr -s "\n-" " "))
echo -e "${DNSID[1]} ${DNSID[3]}"
dns1=${DNSID[1]}
dns2=${DNSID[3]}
##
curl --request PUT https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns1 \
--header "X-Auth-Email: leonljunghorn@gmail.com" \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' \
--data '{"content": "'$newip4'",  "name": "12ants.com", "type": "A", "proxied": true}'\
|jq
curl --request PUT https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns2 \
--header "X-Auth-Email: leonljunghorn@gmail.com" \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' \
--data '{"content": "'$newip4'",  "name": "*.12ants.com", "type": "A", "proxied": true}'\
|jq

##
##
zone_id="${CFAPI[4]}"
DNSID=($(curl GET https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records \
--header 'Content-Type: application/json' \
--header 'X-Auth-Email: leonljunghorn@gmail.com' \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' -qs\
|tr -s ',":{[' "\n"|grep "A" -A2 -B9 -x|grep id -x -C1|tr -s "\n-" " "))
echo -e "${DNSID[1]} ${DNSID[3]}"
dns1=${DNSID[1]}
dns2=${DNSID[3]}
##
curl --request PUT https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns1 \
--header "X-Auth-Email: leonljunghorn@gmail.com" \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' \
--data '{"content": "'$newip4'",  "name": "glowfish.se", "type": "A", "proxied": true}'\
|jq
curl --request PUT https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns2 \
--header "X-Auth-Email: leonljunghorn@gmail.com" \
--header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' \
--data '{"content": "'$newip4'",  "name": "*.glowfish.se", "type": "A", "proxied": true}'\
|jq









# curl --request PUT https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns1 \
# --header 'Content-Type: application/json' \
# --header 'X-Auth-Email: leonljunghorn@gmail.com' \
# --header 'X-Auth-key: 7485ffd444b16c4d4e8fa7c71a420bfa065a9' \
# --data '{
#   "content": "$newip4",
#   "name": "12ants.com",
#   "type": "A",
#   "id": "$dns1"
# }'
# 










# PS3='Please enter your choice: '
# options=("Option 1" "Option 2" "Option 3" "${CFAPI[4]} 4" "Quit")
# select opt in "${options[@]}"
# do
#     case $opt in
#         "Option 1")
#             echo "option 1 = ${CFAPI[1]} = ${CFAPI[0]} "; zone_id="${CFAPI[0]}";
#             ;;
#         "Option 2")
#             echo "option 2 = ${CFAPI[5]} = ${CFAPI[4]} ";  zone_id="${CFAPI[4]}";
#             ;;
#         "Option 3")
#             echo "you chose choice $REPLY which is $opt"
#             ;;    
# 		"Option 4")
#             echo "option 4 = ${CFAPI[5]} = ${CFAPI[4]} "
#             ;;
#         "Quit")
#             break
#             ;;
#         *) echo "invalid option $REPLY";;
#     esac
# done





