#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.


##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..."
sudo apt-get -qq update;
sudo apt-get -qq upgrade -qfy;
sudo apt-get -qq dist-upgrade -qfy;
echo "done"

#######################
##apt-get installations
echo ">>Installing new software..."
sudo apt-get -qq install -fy open-vm-tools-* gcc-multilib g++-multilib thefuck wget curl zsh python python3 vim-runtime vim-gui-common python2.7 python2.7-dev python-pip quassel-client cinnamon
echo "done"

echo ">>PIP>>Installing python requests..."
sudo pip install requests
echo "done"
echo ">>PIP>>Installing pwntools..."
sudo -H pip install pwntools
echo "done"

#####################
##Radare2 Install
echo ">>Git Cloning radare2..."
git clone https://github.com/radare/radare2.git
echo "done"

echo ">>Installing radare2..."
./sys/install.sh
echo "done"

#######################
##Peda Install
echo ">>Installing peda..."
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "done"

#########################################
##Install Scud-Cloud, ubuntu slack client
sudo apt-add-repository -y ppa:rael-gc/scudcloud
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get update
sudo apt-get install scudcloud

######################
##Oh-My-Zsh Install
echo ">>Installing Oh-My-Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
