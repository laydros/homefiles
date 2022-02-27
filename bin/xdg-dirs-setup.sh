#!/bin/bash

userdirsfile=$HOME/.config/user-dirs.dirs

echo "userdir file is $userdirsfile"

function remove_empty_directory () {
    if [ ! -e $1 ]; then
        echo "file/dir $1 doesn't exist, skipping..."
    else
        if [ $(ls -A "$1" | wc -l) -ne 0 ]; then
            echo "dir $1 is not empty, skipping..."
        else
            echo "removing directory $1"
            rmdir $1
        fi
    fi
}

function create_dir () {
    if [ -e $1 ]; then
        echo "file/dir $1 already exists, skipping..."
    else
        echo "creating $1"
        mkdir -p $1
    fi
}

echo "Remove old standard directories if empty..."
remove_empty_directory $HOME/Music
remove_empty_directory $HOME/Public
remove_empty_directory $HOME/Templates
remove_empty_directory $HOME/Desktop
remove_empty_directory $HOME/Documents
remove_empty_directory $HOME/Downloads
remove_empty_directory $HOME/Pictures
remove_empty_directory $HOME/Videos

echo "Create new var and media directories in $HOME"
create_dir $HOME/var
create_dir $HOME/media

echo "backup existing xdg user-dirs.dirs"
if [ -e $userdirfile ]; then
    mv -v $userdirsfile $userdirsfile.bak
fi

echo "use xdg-user-dirs-update command to create directories"
xdg-user-dirs-update --set DOWNLOAD $HOME/dl
xdg-user-dirs-update --set DOCUMENTS $HOME/doc
xdg-user-dirs-update --set PICTURES $HOME/var/img
xdg-user-dirs-update --set VIDEOS $HOME/var/video
xdg-user-dirs-update --set DESKTOP $HOME/doc/desktop
xdg-user-dirs-update --set MUSIC $HOME/music
xdg-user-dirs-update --set PUBLIC $HOME/
xdg-user-dirs-update --set TEMPLATES $HOME/

