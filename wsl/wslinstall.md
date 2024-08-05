## 启用wsl
```
wsl --install --no-distribution
```

### 下载内核包 一般不用下，arch的包里有  
[wsl_update_x64.msi](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)


### 设置默认版本，较新系统一般默认已经是wsl2  
```
wsl --set-default-version 2
```

## 设置.wslconfig
```.wslconfig
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=6GB

# Sets the VM to use two virtual processors
processors=2

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=2GB

# Turn on default connection to bind WSL 2 localhost to Windows localhost
localhostforwarding=true

ipv6=true
# mirrored模式可能会导致win中安装的sql客户端连接不到wsl中的容器里的mysql
# networkingMode=mirrored
# dnsTunneling=true
firewall=false
autoProxy=true
defaultVhdSize=137438953472

[experimental]
autoMemoryReclaim=gradual
bestEffortDnsParsing=true
useWindowsDnsCache=true
```

## 安装arch的wsl包，任选一个
https://github.com/yuk7/ArchWSL/releases

## 启动wsl，设置用户
```
passwd
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash ru
passwd ru
exit
```

## 在Arch安装目录打开cmd 设置默认启动用户
```
./Arch.exe config --default-user ru
```

重启电脑或运行
```
net stop lxssmanager && net start lxssmanager // win11上好像无效
```
> 实测不需要重启电脑

## 换源
```
sudo vim /etc/pacman.d/mirrorlist
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

## 设置密钥环
```
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syy archlinux-keyring
```

## 更新系统
```
sudo pacman -Rsun vim nano  // 先卸载不需要的包
sudo pacman -Syyu
sudo pacman -S neovim bash-completion
```

### 好像有点用的设置
```
sudo nvim /etc/pacman.conf
```
```pacman.conf
# UseSyslog
# Color
# NoProgressBar
```

### 设置同时下载软件包数量
```pacman.conf
# ParallelDownloads = 5
```

## 添加aur的源
```pacman.conf
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

## 安装aur
```
sudo pacman -Syu
sudo pacman -S archlinuxcn-keyring  // 这里会等挺久的
sudo pacman -Syu
sudo pacman -S yay
```

## yay下载软件包推荐流程，有强迫症可以这样操作
```
pacman -Syyu
yay -S git  // yay git
yay git --aur | --repo  // 可以选择从哪里下载或者默认先从仓库下载，再aur

yay -Rns $(pacman -Qtdq)  // 删除孤立包

yay -Scc  // 清理缓存
rm -rf /tmp/*
```

## 关闭wsl
```
wsl --shutdown
```

### 安装docker
```
sudo pacman -S docker
sudo usermod -aG docker ru
newgrp docker
sudo mkdir /etc/docker
sudo nvim /etc/docker/daemon.json
```
```daemon.json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100M"
  },
  "registry-mirrors": [
    "https://docker.m.daocloud.io"
  ]
}
```
```
sudo systemctl enable docker  // 设置开机启动
sudo systemctl enable --now docker  // 这里可能要等很久，设置开机启动并立即启动
sudo systemctl start docker  // 启动
```