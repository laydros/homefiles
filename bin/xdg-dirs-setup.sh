#!/bin/bash

userdirsfile=$HOME/.config/user-dirs.dirs

echo "Create new directories in $HOME"
mkdir $HOME/doc
mkdir $HOME/media
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
echo "" >> $userdirsfile
echo "XDG_DOCUMENTS_DIR=$HOME/doc/doc" >> $userdirsfile
echo "XDG_DESKTOP_DIR=$HOME/doc/desktop" >> $userdirsfile
echo "XDG_DOWNLOAD_DIR=$HOME/doc/dl" >> $userdirsfile
echo "XDG_TEMPLATES_DIR=$HOME/" >> $userdirsfile
echo "XDG_PUBLICSHARE_DIR=$HOME/" >> $userdirsfile
echo "XDG_MUSIC_DIR=$HOME/doc/media/music" >> $userdirsfile
echo "XDG_PICTURES_DIR=$HOME/doc/media/img" >> $userdirsfile
echo "XDG_VIDEOS_DIR=$HOME/doc/media/video" >> $userdirsfile
