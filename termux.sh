#!/bin/bash
# before ./termux.sh, you need "pkg upgrade && pkg install git" first
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
echo "change mirrors to ustc"
if ! grep ustc $PREFIX/etc/apt/sources.list
then 
    echo "deb https://mirrors.ustc.edu.cn/termux stable main" > $PREFIX/etc/apt/sources.list
fi

pkg install -y git openssh cowsay tree zsh wget curl build-essential cmake python vim ctags

# set cowsay "Don't do anything stupid" to launch welcome
#cowsay "Don't do anything stupid" > $PERFIX/etc/motd
#echo -e "\n\n\n\n" >> $PERFIX/etc/motd

# install oh my zsh and it's plugin zsh-syntax-highlight
cd
echo "begin to get oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' .zshrc

# enable phone internal storage for termux
termux-setup-storage
sleep 10
if [! -d "$HOME/storage/downloads/termux"]
then
	mkdir $PREFIX/home/storage/downloads/termux
	echo "storage/downloads/termux created"
fi
ln -sf storage/downloads/termux termux

# install vim-plug for vim
echo "begin to install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/dianbanjiu/.vimrc vimrc 
mv vimrc/.vimrc ~/.vimrc
rm -rf vimrc 

vim "-c PlugInstall"
chsh -s zsh
