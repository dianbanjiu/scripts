#!/bin/bash
# before ./termux.sh, you need "pkg upgrade && pkg install git" first
# enable two level keyboard, and disable bell and shock
cd
if [ ! -d ".termux" ]
then
    mkdir .termux
    if ! grep extra-key $HOME/.termux/termux.properties  
    then
        echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> .termux/termux.properties
        echo "bell-character = ignore" >> .termux/termux.properties 
    fi
fi

# change repo mirrors to ustc
# ustc && tuna termux mirror has some problems,
# so you can enable it as your wish.
# to do that, you just delete the "#" below 5 line.

# echo "change mirrors to ustc"
# if ! grep ustc $PREFIX/etc/apt/sources.list
# then 
#     echo "deb https://mirrors.ustc.edu.cn/termux stable main" >> $PREFIX/etc/apt/sources.list
# fi

pkg install -y git openssh cowsay tree zsh wget curl build-essential cmake python vim ctags imagemagic ffmpeg termux-tools termux-api

# set cowsay "Don't do anything stupid" to launch welcome
cowsay "Don't do anything stupid" > ../usr/etc/motd

# enable phone internal storage for termux
termux-setup-storage

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install youtube-dl

# install oh my zsh and plugin zsh-syntax-highlight
cd
echo "begin to get oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' .zshrc

# downloads the simple vim script
git clone https://github.com/dianbanjiu/dotvimrc vimrc 
mv vimrc/vimrc ~/.vimrc
rm -rf vimrc 

vim "-c PlugInstall"