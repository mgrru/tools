#!/bin/bash

os_name=$(uname)
file_name_arr=(".bashrc")
bash_file_path=""

if [ $os_name = "Linux" ]
then
	cd
	bash_file_path=$(pwd)
else
  echo "当前非Linux,可能出现问题！继续需要手动删除exit 1"
  exit 1
fi

i=0
while(( $i<${#file_name_arr[*]} ))
do
	cd -
  cur_dir=$(pwd)
  cp $cur_dir/bash/${file_name_arr[$i]} $bash_file_path
	i=$i+1
done

echo "复制成功!"
