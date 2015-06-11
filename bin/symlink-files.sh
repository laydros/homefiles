#!/bin/sh

echo "Creating symlinks for dotfiles:"

echo "...create emacs dirs"
mkdir -p ~/.emacs.d/laydros-lisp

echo "...emacs.d/init.el, laydros-org.el, org-contacts.el"
ln -s ~/code/homefiles/emacs.d/init.el ~/.emacs.d/init.el
ln -s ~/code/homefiles/emacs.d/laydros-lisp ~/.emacs.d/laydros-lisp

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
mkdir ~/Maildir

echo "...offlineimaprc"
ln -s ~/code/homefiles/offlineimaprc ~/.offlineimaprc

echo "...vimrc"
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
