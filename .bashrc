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
alias pacS='pacman -S'
# 删除软件包 sudo
alias pacRns='pacman -Rns'
# 清理依赖包 sudo
alias pacSc='pacman -Sc'
# 查找孤立包
alias pacQdt='pacman -Qdt'
# 删除孤立的包 sudo
alias pacRnsqdt='pacman -Rns $(pacman -Qtdq)'
# 查找安装的软件包信息
alias pacQi='pacman -Qi'
# 查找命令的来源包
alias pacF='pacman -F'
# 查看软件包的统计信息
alias yayPs='yay -Ps'
# 清理yay的依赖和缓存
alias yayYc='yay -Sc && yay -Yc'

# 设置打印皮肤
DEFAULT=$PS1
GIT_BRANCH_NAME=$(git branch --show-current 2>/dev/null)
LEFT_STR=", ("
RIGHT_STR=")"
RESULT_STR=""
if [ $GIT_BRANCH_NAME ] ; then RESULT_STR=$LEFT_STR$GIT_BRANCH_NAME$RIGHT_STR ; fi

PS1="fn \e[34m\u\033[00m@\033[35m\h\033[00m-\$ ([\033[36m\w\033[00m]\033[1;32m\$RESULT_STR\033[00m) -> \033[31m| \t |\033[00m {  \033[2;37m// \s:\v\033[00m\n  "
