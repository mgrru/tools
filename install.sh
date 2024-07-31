#!/bin/bash

os_name=$(uname)
# 默认安装在home目录
# bash_file_path=".bashrc" ".bash_profile"
# git_file_path=".gitconfig"
rust_file_path=".cargo"
# ssh_file_path=".ssh"
nvim_file_path=".config"
home_path=""

if [ $os_name = "Linux" ]
then
	cd
	home_path=$(pwd)
	cd -
else
  echo "当前非Linux,可能出现问题!继续需要手动删除exit 1并设置home_path"
  exit 1
fi

cp -Rf bash/.* $home_path
cp -Rf git/.* $home_path
mkdir -p $home_path/$rust_file_path
cp -Rf rust/*.* $home_path/$rust_file_path
# cp -Rf ssh/.* $home_path
cp -Rf nvim $home_path/$nvim_file_path

echo "复制成功!"
