#!/bin/bash

EMACS_INIT=~/.emacs.d/init.el
BIN_DIR=~/bin
GITCONFIG=~/.gitconfig

VIMRC=~/.vimrc
OFFLINEIMAP=~/.offlineimaprc
I3DIR=~/.i3
I3STATUS=~/.i3status
MUTTDIR=~/.mutt
AUTOKEYDIR=~/.config/autokey

function check_file_not_exist {
    return_code=1
    if [ -e $1 ]; then
        echo "file/dir $1 already exists, skipping..."
	    return_code=0
    fi
    return $return_code
}

echo "Creating symlinks for dotfiles:"

echo "...create emacs dirs"
mkdir -p ~/.emacs.d/laydros-lisp


check_file_not_exist $EMACS_INIT

if [ $? -eq 1 ]
then
    echo "...emacs.d/init.el, laydros-org.el, org-contacts.el, etc."
    ln -s ~/code/homefiles/emacs.d/init.el $EMACS_INIT
    ln -s ~/code/homefiles/emacs.d/laydros-lisp ~/.emacs.d/laydros-lisp
fi

check_file_not_exist $BIN_DIR

if [ $? -eq 1 ]
then
    echo "...bin directory"
    ln -s ~/code/homefiles/bin $BIN_DIR
fi

check_file_not_exist $GITCONFIG

if [ $? -eq 1 ]
then
    echo "...gitconfig and gitignore"
    ln -s ~/code/homefiles/gitconfig $GITCONFIG
    ln -s ~/code/homefiles/gitignore_global ~/.gitignore_global
fi


check_file_not_exist $I3DIR

if [ $? -eq 1 ]
then
    echo "...i3 dir and i3status.conf"
    ln -s ~/code/homefiles/i3status.conf $I3STATUS
    ln -s ~/code/homefiles/i3 $I3DIR
fi


#echo "...msmtprc"
#ln -s ~/code/homefiles/msmtprc ~/.msmtprc

check_file_not_exist $MUTTDIR

if [ $? -eq 1 ]
then
    echo "...mutt folder and create Maildir folder"
    ln -s ~/code/homefiles/mutt $MUTTDIR

    if [ ! -d ~/Maildir ]; then
        mkdir ~/Maildir
    fi
fi

echo "...offlineimaprc"
ln -s ~/code/homefiles/offlineimaprc ~/.offlineimaprc

check_file_not_exist $VIMRC

if [ $? -eq 1 ]
then
    echo "...vimrc"
    ln -s ~/code/homefiles/vimrc $VIMRC
fi

echo "...Xresources"
ln -s ~/code/homefiles/Xresources ~/.Xresources

echo "...zshrc"
ln -s ~/code/homefiles/zshrc ~/.zshrc

check_file_not_exist $AUTOKEYDIR

if [ $? -eq 1 ]
then
    echo "...autokey config"
    ln -s ~/code/homefiles/autokey ~/.config/autokey
fi

echo "...xbindkeys config files"
ln -s ~/code/homefiles/xbindkeysrc ~/.xbindkeysrc
ln -s ~/code/homefiles/xbindkeysrc-mpd ~/.xbindkeysrc-mpd
ln -s ~/code/homefiles/xbindkeysrc-spotify ~/.xbindkeysrc-spotify

