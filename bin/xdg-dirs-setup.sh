#!/bin/bash

userdirsfile=$HOME/.config/user-dirs.dirs

echo "Create new directories in $HOME"
mkdir $HOME/doc
mkdir $HOME/doc/desktop
mkdir $HOME/dl
mkdir $HOME/media/music
mkdir $HOME/media/img
mkdir $HOME/media/video
mkdir $HOME/var

echo "backup existing xdg user-dirs.dirs"
if [ -e $userdirfile ]; then
    mv -v $userdirsfile $userdirsfile.bak
fi


echo "writing to file"
echo "## xdg user-dirs.dirs\n" > $userdirsfile
echo "XDG_DOCUMENTS_DIR=$HOME/doc/doc"
echo "XDG_DESKTOP_DIR=$HOME/doc/desktop"
echo "XDG_DOWNLOAD_DIR=$HOME/doc/dl"
echo "XDG_TEMPLATES_DIR=$HOME/"
echo "XDG_PUBLICSHARE_DIR=$HOME/"
echo "XDG_MUSIC_DIR=$HOME/doc/media/music"
echo "XDG_PICTURES_DIR=$HOME/doc/media/img"
echo "XDG_VIDEOS_DIR=$HOME/doc/media/video"
