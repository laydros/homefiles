#!/bin/bash

EMACS_INIT=~/.emacs.d/init.el
LAYDROS_LISP=~/.emacs.d/laydros-lisp
BIN_DIR=~/bin
GITCONFIG=~/.gitconfig
GITIGNORE=~/.gitignore_global
VIMRC=~/.vimrc
OFFLINEIMAPRC=~/.offlineimaprc
I3DIR=~/.i3
I3STATUS=~/.i3status
MUTTDIR=~/.mutt
AUTOKEYDIR=~/.config/autokey
NANORC=~/.nanorc
XRESOURCES=~/.Xresources
ZSHRC=~/.zshrc
XBINDRC=~/.xbindkeysrc
XBINDMPD=~/.xbindkeysrc-mpd
XBINDSPOT=~/.xbindkeysrc-spotify

function symlink_file () {
    if [ -e $1 ]; then
        echo "file/dir $1 already exists, skipping..."
    else
        echo "...symlink $1"
        ln -s $2 $1
    fi
}

echo "Create a couple of directories if they don't exist"
#mkdir -p ~/Maildir
mkdir -p ~/.emacs.d
echo "Creating symlinks for dotfiles:"
symlink_file $LAYDROS_LISP ~/code/homefiles/emacs.d/laydros-lisp
symlink_file $EMACS_INIT ~/code/homefiles/emacs.d/init.el
symlink_file $BIN_DIR ~/code/homefiles/bin
symlink_file $NANORC ~/code/homefiles/nanorc
symlink_file $GITCONFIG ~/code/homefiles/gitconfig
symlink_file $GITIGNORE ~/code/homefiles/gitignore_global
#symlink_file $I3STATUS ~/code/homefiles/i3status.conf
#symlink_file $I3DIR ~/code/homefiles/i3 
#symlink_file $MUTTDIR ~/code/homefiles/mutt
#symlink_file $OFFLINEIMAPRC ~/code/homefiles/offlineimaprc
symlink_file $VIMRC ~/code/homefiles/vimrc
#symlink_file $XRESOURCES ~/code/homefiles/Xresources
symlink_file $ZSHRC ~/code/homefiles/zshrc
#symlink_file $XBINDRC ~/code/homefiles/xbindkeysrc 
#symlink_file $XBINDMPD ~/code/homefiles/xbindkeysrc-mpd 
#symlink_file $XBINDSPOT ~/code/homefiles/xbindkeysrc-spotify 
#symlink_file $AUTOKEYDIR ~/.config/autokey

echo "you may want to run bin/lappy.sh to setup fstab"
