#!/usr/bin/env bash

# Install VirtualBox

# Based on https://www.virtualbox.org/wiki/Linux_Downloads

echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -  # TODO: fail if Oracle public key for apt-secure fingerprint is incorrect
sudo apt-get update
sudo apt-get --assume-yes install virtualbox-4.3
