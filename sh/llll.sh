llll() {
local baseip=$(arp -a) && local baseip=${baseip%%\)*} && local baseip=${baseip##*\(}
echo $baseip
}
