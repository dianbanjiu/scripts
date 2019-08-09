#!/bin/bash

# Install dokcer-ce for ubuntu 16.04+
# Run it with non-root user
sudo apt update
# Preinstall essential softwares
sudo apt install apt-transport-https curl gnupg-agent software-properties-common

# add docker office stable repo to ubuntu repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install docker-ce

# Add docker to current user group
sudo usermod -aG docker $USER

