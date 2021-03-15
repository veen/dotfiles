#!/usr/bin/env bash

# Check if Command Line Tools are installed; if not, install them

    xcode_installed=`xcode-select -p 1>/dev/null;echo $?`
    if [ $xcode_installed == 2 ]; then
        xcode-select --install;
    else
        echo "Command Line Tools already installed...";
    fi;

# Install Homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle --file ~/Dropbox/dotfiles/Brewfile

# Make symlinks to dotfiles in home directory

    ln -s ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/Dropbox/dotfiles/.inputrc ~/.inputrc
    ln -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
    echo "Symlinks created in home directory.";