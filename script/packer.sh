#!/usr/bin/env bash

# Install Packer

mkdir /tmp/packer
wget -P /tmp/packer https://dl.bintray.com/mitchellh/packer/0.6.1_linux_amd64.zip
sudo apt-get --assume-yes install unzip
sudo unzip /tmp/packer/0.6.1_linux_amd64.zip -d /usr/local/packer
rm /tmp/packer/*
rmdir /tmp/packer
echo "export PATH=$PATH:/usr/local/packer" | sudo tee /etc/profile.d/packer.sh
sudo chmod a+x /etc/profile.d/packer.sh
