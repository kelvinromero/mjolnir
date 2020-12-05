#!/bin/bash

sudo apt show xclip >/dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "Installing dependencies..."
    sudo apt install xclip
fi

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
    if [ -z "$1" ]; then
        echo "\nInform the key name, example:"
        echo -e "\n\t $ make ssh-key name=mey-key-name\n"
        exit
    fi

    echo "Creating ssh key..."
    ssh-keygen -t ed25519 -C "$1" -f ~/.ssh/id_ed25519.pub
else
    echo "Already exists!"
fi

echo "SSH key copyed!"
xclip -sel clip <~/.ssh/id_ed25519.pub
