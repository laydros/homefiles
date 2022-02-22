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

#echo "Remove old standard directories if empty..."
#remove_empty_directory $HOME/Music
#remove_empty_directory $HOME/Public
#remove_empty_directory $HOME/Templates
#remove_empty_directory $HOME/Desktop
#remove_empty_directory $HOME/Documents
#remove_empty_directory $HOME/Downloads
#remove_empty_directory $HOME/Pictures
#remove_empty_directory $HOME/Videos

echo "Create new directories in $HOME"
create_dir $HOME/doc
create_dir $HOME/media
create_dir $HOME/doc/desktop
create_dir $HOME/dl
create_dir $HOME/music
create_dir $HOME/media/img
create_dir $HOME/media/video
create_dir $HOME/var

echo "backup existing xdg user-dirs.dirs"
if [ -e $userdirfile ]; then
    mv -v $userdirsfile $userdirsfile.bak
fi


echo "writing to file $userdirsfile"
echo "## xdg user-dirs.dirs\n" > $userdirsfile
echo "" >> $userdirsfile
echo "XDG_DOCUMENTS_DIR=$HOME/doc/doc" >> $userdirsfile
echo "XDG_DESKTOP_DIR=$HOME/doc/desktop" >> $userdirsfile
echo "XDG_DOWNLOAD_DIR=$HOME/doc/dl" >> $userdirsfile
echo "XDG_TEMPLATES_DIR=$HOME/" >> $userdirsfile
echo "XDG_PUBLICSHARE_DIR=$HOME/" >> $userdirsfile
echo "XDG_MUSIC_DIR=$HOME/doc/media/music" >> $userdirsfile
echo "XDG_PICTURES_DIR=$HOME/doc/media/img" >> $userdirsfile
echo "XDG_VIDEOS_DIR=$HOME/doc/media/video" >> $userdirsfile
