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
# 打开终端配色
export CLICOLOR=256
export LSCOLORS=ExGxFxdaCxDaDahbadech

alias sudo='sudo '

# 常用基本命令
alias ls='ls -F --color=auto'
alias la='ls -aF'
alias ll='ls -laF'
alias grep='grep --color=auto'

alias vim='nvim'
alias vi='nvim'

# 更新软件包和系统 sudo
alias pacSyu='pacman -Syu'
# 强制更新 sudo
alias pacSyyu='pacman -Syyu'
# 查找软件包
alias pacSs='pacman -Ss'
alias pacSsq='pacman -Ssq'
# 下载软件包 sudo
alias pacS='pacman -S --needed'
# 删除软件包和依赖包和配置文件 sudo
alias pacRsun='pacman -Rsun'
# 清理缓存 sudo
alias pacSc='pacman -Sc'
alias pacScc='pacman -Scc'
# 查找可更新包
alias pacQu='pacman -Qu'
# 查找软件已安装包组
alias pacQg='pacman -Qg'
# 查找孤立包
alias pacQdt='pacman -Qdt'
# 查找不被依赖的包
alias pacQet='pacman -Qet'
# 删除孤立的包 su root
alias pacRsnQtdq='pacman -Qtdq | pacman -Rsun -'
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

# 仅参考使用，不同终端不同主题的颜色都可能不一样
# | 字体 | 背景 | 颜色 | 其他 | ... |
# | 30 | 40 | 黑色 | 0 | 无 |
# | 31 | - | 红色 | 1 | 高亮 | 但是好像没什么效果
# | 32 | - | 绿色 | 2 | 暗淡 |
# | 33 | - | 黄色 | 3 | 斜体 |
# | 34 | - | 蓝色 | 4 | 下划线 |
# | 35 | - | 紫色 | 5 | 闪烁 |
# | 36 | - | 青色 | 6 | 未知 |
# | 37 | - | 白色 | 7 | 反底色 |
# | -- | -- | -- | 8 | 隐藏 |

clear_color="\e[0m"
# 设置打印皮肤
get_os_name() {
  os_name=$(uname -a)
  left_str="\e[0m\e[34;40;1m "
  right_str=" \e[0m"$clear_color
  if [[ $os_name =~ "Arch" ]]
  then
    echo $left_str" "$right_str
  elif [[ $os_name =~ "WSL" ]]
  then
    echo $left_str" "$right_str
  elif [[ $os_name =~ "Windows" ]]
  then
    echo $left_str" "$right_str
  else
    echo $left_str" "$right_str
  fi
}
get_git_branch() {
  git_branch_name=$(git branch --show-current 2>/dev/null)
  left_str="\e[34;7m\e[0m\e[37;44;1m "
  right_str=" \e[0m\[\e[34m\]"$clear_color
  if [ $git_branch_name ]
  then
    echo $left_str" "$git_branch_name$right_str
  fi
}
get_workspace() {
  left_str="\e[32;7m\e[0m\e[37;42;1m "
  right_str=" \e[0m\[\e[32m\]"$clear_color
  echo $left_str"\w"$right_str
}
get_user_name() {
  left_str="\e[36;40;7m$clear_color\e[34;46;1m "
  right_str=" $clear_color\e[36m"$clear_color

  user_str="\e[35m\u"
  at_str="\e[37m@"
  hostname_str="\e[31m\h"

  echo $left_str$user_str$at_str$hostname_str$right_str
}

PROMPT_COMMAND='PS1="$(get_os_name)$(get_user_name)$(get_git_branch)$(get_workspace) \e[37;2m=> 󰅒 \t =>  \s:\v$clear_color\n"'
