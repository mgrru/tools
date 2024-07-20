#!/bin/bash

os_name=$(uname)
# 默认是在home目录下的文件
bash_file_arr=(".bashrc" ".bash_profile")
git_file_arr=(".gitconfig")
rust_file_arr=(".cargo/config.toml")
ssh_file_arr=(".ssh")
nvim_file_arr=(".config/nvim")
home_path=""

if [ $os_name = "Linux" ]
then
	cd
	home_path=$(pwd)

	cd -
fi

i=0
while(( $i<${#bash_file_arr[*]} ))
do
	mkdir -p bash
	cp -Rf $home_path/${bash_file_arr[$i]} bash

	i=$i+1
done

i=0
while(( $i<${#git_file_arr[*]} ))
do
  mkdir -p git
	cp -Rf $home_path/${git_file_arr[$i]} git

	i=$i+1
done

i=0
while(( $i<${#rust_file_arr[*]} ))
do
  mkdir -p rust
	cp -Rf $home_path/${rust_file_arr[$i]} rust
	i=$i+1
done

i=0
while(( $i<${#ssh_file_arr[*]} ))
do
  mkdir -p ssh
	cp -Rf $home_path/${ssh_file_arr[$i]} ssh

	i=$i+1
done

i=0
while(( $i<${#nvim_file_arr[*]} ))
do
  mkdir -p nvim
	cp -Rf $home_path/${nvim_file_arr[$i]}/* nvim

	i=$i+1
done

echo "复制成功!"
