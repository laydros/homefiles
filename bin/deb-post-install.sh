#! /bin/sh

SOURCES_LIST=""


# List of packages to install
LIST=""

# media players
LIST=$LIST" vlc ffmpeg spotify-client"

# media codecs
LIST=$LIST" gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly"

# browser plugins
LIST=$LIST" flashplugin-nonfree"

# cli utils
LIST=$LIST" curl wget git vim"

# common dev tools
LIST=$LIST" geany meld gitk"

# python
LIST=$LIST" python-pip idle-python2.7 python-rope"

# shell stuff
LIST=$LIST" rxvt-unicode zsh tmux"

# archive
LIST=$LIST" p7zip unace-nonfree unrar unzip zip"

# graphics and fonts
LIST=$LIST" gimp ttf-bitstream-vera ttf-dejavu ttf-freefont ttf-mscorefonts-installer gtk2-engines-murrine"

# Diodon clipboard manager
LIST=$LIST" diodon diodon-plugins"



#----------------------

# add spotify to sources.list
echo "Adding Spotify repo and key"
echo ""
# echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
apt-get update

# clear

# echo "Upgrading existing packages before install..."
# echo ""
# apt-get upgrade
# echo ""
# sleep 2s
# echo ""
# apt-get dist-upgrade
echo ""
sleep 2s
#---------------------
clear
echo "Installing package list..."
echo ""
apt-get install $LIST
echo ""
