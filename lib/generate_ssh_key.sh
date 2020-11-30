#!/bin/bash

sudo apt show xclip > /dev/null 2>&1
if [ ! $? -eq 0]; then
    echo "Installing dependencies"
    sudo apt install xclip
fi

if [ -z "$1" ]; then
    echo "Inform the key name, example:"
    echo -e "\t $ make ssh-key name=mey-key-name"
    exit
fi

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
    echo "Criando chave SSH"
    ssh-keygen -t ed25519 -C "$1"
fi

echo "SSH key copyed!"
xclip -sel clip <~/.ssh/id_ed25519.pub
