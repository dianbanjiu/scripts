#!/bin/bash

# 适用于 Ubuntu 16.04 及以上的版本
# 最好以普通用户的身份来执行该脚本
sudo apt update
# 需要预先安装的软件
sudo apt install apt-transport-https curl gnupg-agent software-properties-common

# 添加 docker 的官方源到 Ubuntu 的库中
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install docker-ce

# 添加 docker 到当前用户组，方便在之后可以通过普通用户的身份来使用 docker
sudo usermod -aG docker $USER

# 更改 docker 的源为中科大镜像源，加速国内的镜像获取速度
sudo touch /etc/docker/daemon.json
sudo echo -e "{\n    \"registry-mirrors\": [\"https://docker.mirrors.ustc.edu.cn/\"]\n}" > /etc/docker/daemon.json
