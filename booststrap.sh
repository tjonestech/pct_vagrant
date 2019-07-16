#!/usr/bin/env bash

#1 Update OS (Ubuntu) apt packages
#2 Setup Vitualbox repos
#3 Update new repo
#4 Install known dependencies
#5 Install VirtualBox
#6 Install Vagrant
#7 Create a local directory for Vagrant
#8 Git the Vagrantfile in your newly created directory
#9 Run vagrant up and provisioning your virtual machine


#1 Update OS (Ubuntu) apt packages
apt-get update -y && apt-get upgrade -y 

#2 Setup Vitualbox repos
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | tee /etc/apt/sources.list.d/virtualbox.list

#3 Update new repo
apt-get update -y && apt-get upgrade -y 

#4 Install known dependencies
sudo apt-get install linux-headers-$(uname -r) build-essential dkms


sudo apt install virtualbox virtualbox-ext-pack 

# Install Guest Additions
sudo apt-get install virtualbox-guest-additions-iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro /usr/share/virtualbox/VBoxGuestAdditions*.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm /usr/share/virtualbox/VBoxGuestAdditions*.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions


sudo apt install vagrant
