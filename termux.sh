#!/bin/bash
if [ ! -d ".termux" ]
then
    mkdir .termux
fi

echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > .termux/termux.properties
echo "bell-character = ignore" >> .termux/termux.properties

# change repo mirrors to ustc
echo "change mirrors to ustc"
echo "deb https://mirrors.ustc.edu.cn/termux stable main" > $PREFIX/etc/apt/sources.list

apt update
apt upgrade -y

apt install -y git openssh cowsay tree zsh wget curl build-essential cmake python-dev vim-python

# set cowsay "Don't do anything stupid" to launch welcome
# cowsay "Don't do anything stupid" > $PERFIX/etc/motd
# echo -e "\n\n\n\n" >> $PERFIX/etc/motd

# install oh my zsh and it's plugin zsh-syntax-highlight
cd
echo "begin to get oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' .zshrc

# enable phone internal storage for termux
#termux-setup-storage
#if [! -d "$HOME/storage/downloads/termux"]
#then
#	mkdir $PREFIX/home/storage/downloads/termux
#	echo "storage/downloads/termux created"
#fi

ln -sf storage/downloads/termux termux

# install vim-plug for vim
echo "begin to install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/dianbanjiu/.vimrc vimrc 
mv vimrc/.vimrc ~/.vimrc
rm -rf vimrc 

vim "-c PlugInstall"
cd ~/.vim/plugged/YouCompleteMe
python install.py

