#!/bin/bash

sudo apt update
sudo apt upgrade

package_list="git
    zsh
    readline-devel
    zlib-devel
    nodejs
    yarnpkg
    gcc
    sqlite-devel
    chrome-gnome-shell
    xclipx"

if [ $(lsb_release -rs) == "20.04" ]; then
    package_list=$package_list+" libssl-dev"
    sudo apt install $package_list
elif [ $(lsb_release -rs) == "18.04" ]; then
    package_list=$package_list+" openssl-devel"
    sudo apt install $package_list

fi
