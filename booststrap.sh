#!/usr/bin/env bash

#1 Update OS (Ubuntu) apt packages
apt-get update -y && apt-get upgrade -y 

#4 Install known dependencies
sudo apt-get install linux-headers-$(uname -r) build-essential dkms

# Install Guest Additions
sudo apt-get install virtualbox-guest-additions-iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro /usr/share/virtualbox/VBoxGuestAdditions*.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm /usr/share/virtualbox/VBoxGuestAdditions*.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions

