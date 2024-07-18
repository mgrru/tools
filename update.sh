#!/bin/bash

os_name=$(uname)
# 默认是在home目录下的文件
bash_file_arr=(".bashrc")
git_file_arr=(".gitconfig")
rust_file_arr=(".cargo/config.toml")
ssh_file_arr=(".ssh")
nvim_file_arr=(".config/nvim")
home_path=""

if [ $os_name = "Linux" ]
then
	cd
	home_path=$(pwd)
fi

i=0
while(( $i<${#bash_file_arr[*]} ))
do
	cd -

  mkdir -p bash
	cp -r $home_path/${bash_file_arr[$i]} bash
  mkdir -p git
	cp -r $home_path/${git_file_arr[$i]} git
  mkdir -p rust 
	cp -r $home_path/${rust_file_arr[$i]} rust
  mkdir -p ssh 
	cp -r $home_path/${ssh_file_arr[$i]} ssh
  mkdir -p nvim
	cp -r $home_path/${nvim_file_arr[$i]}/* nvim

	i=$i+1
done


echo "复制成功!"
