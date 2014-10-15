#!/bin/sh

echo "Creating symlinks for dotfiles:"

echo "...emacs.d/init.el, laydros-org.el, org-contacts.el"
ln -s ~/code/homefiles/emacs.d/init.el ~/.emacs.d/init.el
ln -s ~/code/homefiles/emacs.d/laydros-org.el ~/.emacs.d/laydros-org.el
ln -s ~/code/homefiles/emacs.d/org-contacts.el ~/.emacs.d/org-contacts.el

echo "...bin directory"
ln -s ~/code/homefiles/bin ~/bin

echo "...gitconfig"
ln -s ~/code/homefiles/gitconfig ~/.gitconfig

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

echo "...and vimrc"
ln -s ~/code/homefiles/vimrc ~/.vimrc
