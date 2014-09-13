#!/usr/bin/env bash

# Setup  KDE

sudo apt-get --assume-yes update
#sudo apt-get --assume-yes install kubuntu-desktop --no-install-recommends

sudo apt-get --assume-yes install xorg gnome-core gnome-system-tools gnome-app-install

reboot
sleep 60
