#!/bin/bash
catty() {
dir="$1"; 
if [ $dir ]; then break; else read -ep "$c2 folder:" -i "$PWD" "dir"; fi
ee=($(ls $dir -fpA)); ee=(${ee[@]///}); echo "${ee[@]}"
seps="  "$cyan$dim"-------------------------$re"
for i in ${ee[@]///}; do 
ls="$(file -bi $i)";
echo -e "$re  $c2$bold $i $c2 $ls\n$seps$dim";
ls="$(file -ib $i|head -c4)"; if [ $ls = "text" ]; then 
cat $i|head -n8|pr --omit-header --indent=0 --page-width=$((COLUMNS-8)) --indent=2
echo -e "$seps"; fi; done 
}
