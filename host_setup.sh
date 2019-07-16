#!/usr/bin/env bash

#1 Update OS (Ubuntu) apt packages
apt-get update -y && apt-get upgrade -y 

#2 Setup Vitualbox repos
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | tee /etc/apt/sources.list.d/virtualbox.list

#3 Update new repo
apt-get update -y && apt-get upgrade -y 
sudo apt-get install linux-headers-$(uname -r) build-essential dkms
sudo apt install virtualbox virtualbox-ext-pack 
sudo apt install vagrant
