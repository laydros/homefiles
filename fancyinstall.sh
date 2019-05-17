#!/bin/bash -e

#
# Shamelessly stolen and adopted from github.com/Klowner/dotfiles which says
# it is shamelessly stolen and adopted from github.com/statico/dotfiles
#
# Mark's dotfile installer. Usage:
#
# curl https://raw.github.com/Klowner/dotfiles/master/install.sh | bash
# or:
# curl -L http://tinyurl.com/klownerdot | bash
# or:
#
# ~/.dotfiles/install.sh
#
# (It doesn't descend into directories.)

basedir=$HOME/.dotfiles
bindir=$HOME/bin
gitbase=git://github.com/laydros/homefiles.git
tarball=http://github.com/laydros/homefiles/tarball/master

function has() {
    return $( which $1 >/dev/null )
}

function note() {
    echo "[32;1m * [0m$*"
}

function warn() {
    echo "[31;1m * [0m$*"
}

function die() {
    warn $*
exit 1
}

function link() {
    src=$1
    dest=$2

    if [ -e $dest ]; then
        if [ -L $dest ]; then
            # Already symlinked -- I'll assume correctly.
            return
        else
            # Rename files with a ".old" extension.
            warn "$dest file already exists, renaming to $dest.old"
            backup=$dest.old
            if [ -e $backup ]; then
                die "$backup already exists. Aborting."
            fi
            mv -v $dest $backup
        fi
    fi
    
    # Update existing or create new symlinks.
    $(which ln) -vsf $src $dest
}

function unpack_tarball() {
    note "Downloading tarball..."
    mkdir -vp $basedir
    cd $basedir
    tempfile=TEMP.tar.gz
    if has curl; then
        curl -L $tarball >$tempfile
    elif has wget; then
        wget -O $tempfile $tarball
        else:
        die "Can't download tarball."
    fi
    tar --strip-components 1 -zxvf $tempfile
    rm -v $tempfile
}


if [ -e $basedir ]; then
    # Basedir exists. Update it.
    cd $basedir
    if [ -e .git ]; then
        note "Updating dotfiles from git..."
        git pull --rebase origin master
    else
        unpack_tarball
    fi
else
    # .dotfiles directory needs to be installed. Try downloading first with
    # git, then use tarballs.
    if has git; then
        note "Cloning from git..."
        git clone $gitbase $basedir
        cd $basedir
        git submodule init
        git submodule update
    else
        warn "Git not installed."
        unpack_tarball
    fi
fi

note "Installing oh-my-zsh..."
if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

note "Installing dotfiles..."
for path in .* ; do
    case $path in
        .|..|.git)
            continue
            ;;
        *)
            link $basedir/$path $HOME/$path
            ;;
    esac
done

note "Installing bin/ directory..."
mkdir -v -p $bindir
if [ -d bin ]; then
    for path in bin/* ; do
        relpath=$( basename $path )
        link $basedir/$path $bindir/$relpath
    done
fi

#note "Installing neobundle..."
# if has git; then
#     if [[ ! -d ~/.vim/bundle/neobundle.vim ]]; then
#         $basedir/neobundle.sh
#     fi
# fi

note "Symlinking vim configurations..."
for rc in vim gvim; do
    link $basedir/.vim/${rc}rc $HOME/.${rc}rc
    if [ ! -e $HOME/.${rc}local ]; then
        touch $HOME/.${rc}local
    fi
done

note "Installing git submodules..."
if has git; then
    git submodule init
    git submodule update
fi

note "Initializing tools..."
if has git; then
    # Post-install scripts might customize this further.
    cp -v $basedir/.gitconfig.base $HOME/.gitconfig
fi

#note "Installing vim bundles..."
#if has vim; then
# cd $basedir
# ~/.vim/bundle/neobundle.vim/bin/neoinstall
#fi

note "Running post-install script, if any..."
postinstall=$HOME/.postinstall
if [ -e $postinstall ]; then
    # A post-install script can the use functions defined above.
    . $postinstall
fi

note "Done."
