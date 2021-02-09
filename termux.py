#!/usr/bin/env python3

import os

# 启用 termux 的两行键盘
file = open("~/.termux/termux.properties", mode='a')
key='''
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
echo "bell-character = ignore
'''
file.write(key)
file.close()

# 安装一些软件，可以根据情况进行筛选
cmd = "pkg install -y openssh cowsay zsh wget curl build-essential cmake python termux-tools termux-api"
os.system(cmd)

# 更新启动标语
cmd = "cowsay Don't do anything stupid > /data/data/com.termux/files/usr/etc/motd"
os.system(cmd)

# 安装 oh-my-zsh
cmd_list = [
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"',
    'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting',
    "sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc"
    ]
for cmd in cmd_list:
    os.system(cmd)

