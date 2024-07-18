#!/bin/bash

os_name=$(uname)
file_name_arr=(".bashrc")
bash_file_path=""

if [ $os_name = "Linux" ]
then
	cd
	bash_file_path=$(pwd)
fi

i=0
while(( $i<${#file_name_arr[*]} ))
do
	cd -
	cp $bash_file_path/${file_name_arr[$i]} bash
	i=$i+1
done

echo "复制成功!"
