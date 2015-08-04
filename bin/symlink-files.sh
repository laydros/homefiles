#!/bin/bash

EMACS_INIT=~/.emacs.d/init.el
BIN_DIR=~/bin

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

echo "...emacs.d/init.el, laydros-org.el, org-contacts.el"

check_file_not_exist $EMACS_INIT
return_val=$?

if [ $return_val ]
then
    ln -s ~/code/homefiles/emacs.d/init.el $EMACS_INIT
    ln -s ~/code/homefiles/emacs.d/laydros-lisp ~/.emacs.d/laydros-lisp
fi

echo "...bin directory"
ln -s ~/code/homefiles/bin ~/bin

echo "...gitconfig and gitignore"
ln -s ~/code/homefiles/gitconfig ~/.gitconfig
ln -s ~/code/homefiles/gitignore_global ~/.gitignore_global

echo "...i3 dir and i3status.conf"
ln -s ~/code/homefiles/i3status.conf ~/.i3status.conf
ln -s ~/code/homefiles/i3 ~/.i3

#echo "...msmtprc"
#ln -s ~/code/homefiles/msmtprc ~/.msmtprc

echo "...mutt folder and create Maildir folder"
ln -s ~/code/homefiles/mutt ~/.mutt
if [ ! -d ~/Maildir ]; then
    mkdir ~/Maildir
fi

echo "...offlineimaprc"
ln -s ~/code/homefiles/offlineimaprc ~/.offlineimaprc

echo "...vimrc"
if [ -f ~/.vimrc ]; then
    echo ".vimrc exists, skipping"
ln -s ~/code/homefiles/vimrc ~/.vimrc

echo "...Xresources"
ln -s ~/code/homefiles/Xresources ~/.Xresources

echo "...zshrc"
ln -s ~/code/homefiles/zshrc ~/.zshrc

echo "...autokey config"
ln -s ~/code/homefiles/autokey ~/.config/autokey

echo "...xbindkeys config files"
ln -s ~/code/homefiles/xbindkeysrc ~/.xbindkeysrc
ln -s ~/code/homefiles/xbindkeysrc-mpd ~/.xbindkeysrc-mpd
ln -s ~/code/homefiles/xbindkeysrc-spotify ~/.xbindkeysrc-spotify

