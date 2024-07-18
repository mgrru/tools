#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# 设置默认终端文本编辑器
export EDITOR='nvim'

# rust代理
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

alias sudo='sudo '

# 常用基本命令
alias ls='ls -F --color=auto'
alias la='ls -aF'
alias ll='ls -laF'
alias grep='grep --color=auto'

# 更新软件包和系统 sudo
alias pacSyu='pacman -Syu'
# 强制更新 sudo
alias pacSyyu='pacman -Syyu'
# 查找软件包
alias pacSs='pacman -Ss'
# 下载软件包 sudo
alias pacS='pacman -S --needed'
# 删除软件包和依赖包和配置文件 sudo
alias pacRnsu='pacman -Rnsu'
# 清理依赖包 sudo
alias pacSc='pacman -Sc'
# 查找孤立包
alias pacQdt='pacman -Qdt'
# 查找不被依赖的包
alias pacQet='pacman -Qet'
# 删除孤立的包 sudo
alias pacRnsqdtq='pacman -Qtdq | pacman -Rns -'
# 检测某些可能不被检测到的依赖包,比如循环依赖等
alias pacQqd='pacman -Qqd | pacman -Rsu --print -'
# 查找安装的软件包信息
alias pacQi='pacman -Qi'
# 查找命令的来源包
alias pacF='pacman -F'
# 查看软件包的统计信息
alias yayPs='yay -Ps'
# 清理yay的依赖和缓存
alias yayYc='yay -Sc && yay -Yc'

# 不设置这个好像每次都会打开bash都会自动生成一个PS1
DEFAULT=$PS1

clear_color="\e[00m"
# 设置打印皮肤
get_git_branch() {
    text_color="\e[1;32m"
    git_branch_name=$(git branch --show-current 2>/dev/null)
    left_str="("
    right_str=")"
    if [ $git_branch_name ]
    then 
        echo : $text_color$left_str$git_branch_name$right_str$clear_color
    fi
}

PROMPT_COMMAND='PS1="fn \e[34m\u\033[00m@\033[35m\h\033[00m-\$ ([\033[36m\w\033[00m]$(get_git_branch)) -> \033[31m| \t |\033[00m {  \033[2;37m// \s:\v\033[00m\n  "'
