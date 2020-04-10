#!/bin/bash

CONFIG_DIR=$HOME/.config
HOMEFILES=$HOME/src/homefiles

EMACS_INIT=$HOME/.emacs.d/init.el
LAYDROS_LISP=$HOME/.emacs.d/laydros-lisp
# XDG
GITCONFIG=$CONFIG_DIR/git/config
GITIGNORE=$CONFIG_DIR/git/ignore
I3CONFIG=$CONFIG_DIR/i3/config
I3STATUS=$CONFIG_DIR/i3status/config
NANORC=$CONFIG_DIR/nano/nanorc
VIMRC=$CONFIG_DIR/nvim/init.vim
# dump in $HOME - :-(
XBINDRC=~/.xbindkeysrc
XBINDMPD=~/.xbindkeysrc-mpd
XBINDSPOT=~/.xbindkeysrc-spotify
XRESOURCES=~/.Xresources
ZSHRC=~/.zshrc
OFFLINEIMAPRC=~/.offlineimaprc
# Directories
AUTOKEYDIR=$CONFIG_DIR/autokey
BIN_DIR=$HOME/bin
MUTTDIR=$CONFIG_DIR/neomutt

function symlink_file () {
    if [ -e $1 ]; then
        echo "file/dir $1 already exists, skipping..."
    else
        echo "...symlink $1"
        ln -s $2 $1
    fi
}

function linux_specific () {
#    mkdir -p $CONFIG_DIR/i3
#    mkdir -p $CONFIG_DIR/i3status

#    symlink_file $I3CONFIG $HOMEFILES/config/i3config
#    symlink_file $I3STATUS $HOMEFILES/config/i3status.conf

#    symlink_file $XBINDRC $HOMEFILES/xbindkeysrc
#    symlink_file $XBINDMPD $HOMEFILES/xbindkeysrc-mpd
#    symlink_file $XBINDSPOT $HOMEFILES/xbindkeysrc-spotify
#    symlink_file $XRESOURCES $HOMEFILES/config/Xresources
    symlink_file $AUTOKEYDIR $HOMEFILES/autokey
}

echo "Config dir is $CONFIG_DIR and homefiles source is $HOMEFILES"
echo "Create a few directories if they don't exist"
#mkdir -p ~/Maildir
mkdir -p ~/.emacs.d
touch $HOME/emacs.d/custom.el
mkdir -p $CONFIG_DIR
mkdir -p $CONFIG_DIR/nvim
mkdir -p $CONFIG_DIR/git
#mkdir -p $CONFIG_DIR/nano
echo "Creating symlinks for dotfiles:"
symlink_file $EMACS_INIT $HOMEFILES/emacs/init.el
symlink_file $LAYDROS_LISP $HOMEFILES/emacs/laydros-lisp
# XDG
symlink_file $GITCONFIG $HOMEFILES/config/gitconfig
symlink_file $GITIGNORE $HOMEFILES/config/gitignore
#symlink_file $NANORC $HOMEFILES/config/nanorc
symlink_file $VIMRC $HOMEFILES/config/init.vim
#symlink_file $ZSHRC $HOMEFILES/config/zshrc
#symlink_file $OFFLINEIMAPRC ~/code/homefiles/offlineimaprc

# directories
symlink_file $BIN_DIR $HOMEFILES/bin
symlink_file $MUTTDIR $HOMEFILES/config/neomutt

# linux_specific
echo "you may want to run bin/lappy.sh to setup fstab"
