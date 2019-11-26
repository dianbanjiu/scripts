#!/bin/env bash
# For auto install oh my zsh and some plugin
# Please make sure you already pre-install zsh and git

# Access oh-my-zsh script to local
git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Create a new zsh configuration file
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# then change your default shell
chsh -s $(which zsh)

# Clone zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add the two plugin to .zshrc
sed -i 's/plugins=(git/plugins=(git zsh-syntax-highlighting zsh-autosuggestions/g' ~/.zshrc

# Actve the .zshrc
source ~/.zshrc
