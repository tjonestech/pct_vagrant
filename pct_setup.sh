#!/bin/bash

# Dependencies
apt-get update -y && apt-get upgrade -y && apt-get install libcanberra-gtk-module libgconf-2-4 wget -y

# Installer 
cd /tmp/
sudo rm Popcorn-Time-*
sudo wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz

sudo mkdir -p /opt/popcorntime
sudo tar Jxf /tmp/Popcorn-Time-* -C /opt/popcorntime

# Link
sudo ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time

# Desktop Entry
sudo echo "[Desktop Entry]" >> /usr/share/applications/popcorntime.desktop
sudo echo "Version = 3.1" >> /usr/share/applications/popcorntime.desktop
sudo echo "Type = Application" >> /usr/share/applications/popcorntime.desktop
sudo echo "Terminal = false" >> /usr/share/applications/popcorntime.desktop
sudo echo "Name = Popcorn Time" >> /usr/share/applications/popcorntime.desktop
sudo echo "Exec = /usr/bin/Popcorn-Time" >> /usr/share/applications/popcorntime.desktop
sudo echo "Icon = /opt/popcorntime/popcorn.png" >> /usr/share/applications/popcorntime.desktop
sudo echo "Categories = Application;" >> /usr/share/applications/popcorntime.desktop

# icon
sudo wget -O /opt/popcorntime/popcorn.png https://upload.wikimedia.org/wikipedia/commons/d/df/Pctlogo.png

# Cleanup
cd /tmp/
sudo rm Popcorn-Time-*
clean
