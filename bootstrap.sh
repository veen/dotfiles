#!/usr/bin/env bash

# Check if Command Line Tools are installed; if not, install them

    xcode_installed=`xcode-select -p 1>/dev/null;echo $?`
    if [ $xcode_installed == 2 ]; then
        xcode-select --install;
    else
        echo "Command Line Tools already installed...";
    fi;

# Install Homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    brew update;
    brew upgrade;
    brew bundle --file ~/Dropbox/dotfiles/Brewfile;

# Make symlinks to dotfiles in home directory

    ln -sF ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile;
    ln -sF ~/Dropbox/dotfiles/.inputrc ~/.inputrc;
    ln -sF ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig;
    echo "Symlinks created in home directory.";


# Install Fonts

    rsync -avh --exclude "Archive/" ~/Dropbox/Fonts /Library/Fonts/;

# Configure iTerm2 settings
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Dropbox/dotfiles/iterm2";
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true;