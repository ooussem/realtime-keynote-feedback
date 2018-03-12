#!/usr/bin/env bash
# Main ressources installation

HOME_DIR="/home/ubuntu"
PROJECT_DIR="/vagrant"

if [[ "$CI" == "true" ]]; then
    echo "HOME_DIR='$HOME'" >> .bashrc
    echo "PROJECT_DIR='$TRAVIS_BUILD_DIR'" >> .bashrc
else
    echo 'HOME_DIR="/home/ubuntu"' >> .bashrc
    echo 'PROJECT_DIR="/vagrant"' >> .bashrc
fi

source .bashrc

# Dependencies installation on virtual machine
sudo apt-get update
if !$CI
then
    sudo apt-get -y upgrade
fi

# Install utilities
sudo apt-get install -y git unzip wget

# Install python3.5 and pip3
if [[ "$CI" != "true" ]]; then
    sudo apt-get install -y python3.5
fi

sudo apt-get install -y python3-pip
sudo pip3 install --upgrade pip
