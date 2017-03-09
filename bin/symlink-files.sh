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
symlink_file $LAYDROS_LISP ~/src/homefiles/emacs.d/laydros-lisp
symlink_file $EMACS_INIT ~/src/homefiles/emacs.d/init.el
symlink_file $BIN_DIR ~/src/homefiles/bin
symlink_file $NANORC ~/src/homefiles/nanorc
symlink_file $GITCONFIG ~/src/homefiles/gitconfig
symlink_file $GITIGNORE ~/src/homefiles/gitignore_global
#symlink_file $I3STATUS ~/code/homefiles/i3status.conf
#symlink_file $I3DIR ~/code/homefiles/i3 
#symlink_file $MUTTDIR ~/code/homefiles/mutt
#symlink_file $OFFLINEIMAPRC ~/code/homefiles/offlineimaprc
symlink_file $VIMRC ~/src/homefiles/vimrc
symlink_file $XRESOURCES ~/src/homefiles/Xresources
symlink_file $ZSHRC ~/src/homefiles/zshrc
symlink_file $XBINDRC ~/src/homefiles/xbindkeysrc 
symlink_file $XBINDMPD ~/src/homefiles/xbindkeysrc-mpd 
symlink_file $XBINDSPOT ~/src/homefiles/xbindkeysrc-spotify 
symlink_file $AUTOKEYDIR ~/.config/autokey

echo "you may want to run bin/lappy.sh to setup fstab"
