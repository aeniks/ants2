ls=($(ls -Fptrw999 --classify --color --group-directories-first)); echo ${ls[*]:0:22} 
