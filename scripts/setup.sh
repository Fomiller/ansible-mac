#!/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Homebrew could not be found."
    
    echo "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    exit
else
    echo "Homebrew already installed."
    
    echo "Checking for Ansible"
    if ! command -v "brew list ansible" &> /dev/null
    then
        echo "Ansible already installed."
    else 
        echo "Ansible not found. Installing Ansible."
        brew install ansible
    fi
fi
