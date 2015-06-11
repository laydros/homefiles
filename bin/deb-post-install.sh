#! /bin/sh

SOURCES_LIST=""

# List of packages to install
LIST=""

# media players
LIST=$LIST" vlc spotify-client"

# media codecs
LIST=$LIST" gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly libavcodec-extra "

# browser plugins
LIST=$LIST" flashplugin-nonfree"

# cli utils
LIST=$LIST" curl wget git vim ncdu rdesktop"

# common dev tools
LIST=$LIST" geany gitk xbindkeys diffuse autokey-gtk"

# python
LIST=$LIST" python-pip idle-python2.7 python-rope python-dev"

# shell stuff
LIST=$LIST" rxvt-unicode zsh tmux"

# archive
LIST=$LIST" p7zip unace-nonfree unrar unzip zip"

# allow debian to install ppas
LIST=$LIST" software-properties-common python-software-properties "

# graphics and fonts
LIST=$LIST" gimp ttf-bitstream-vera ttf-dejavu ttf-freefont ttf-mscorefonts-installer gtk2-engines-murrine"

# Diodon clipboard manager
#LIST=$LIST" diodon diodon-plugins"

# Parcellite clibboard manager
LIST=$LIST" parcellite"

# libre office style - need to set with Tools->Options->LibreOffice->View
# select sifr under "Icon size and style"
LIST=$LIST" libreoffice-style-sifr "

# ubuntu only
LIST=$LIST" unity-tweak-tool ubuntu-restricted-extras gnome-sushi "

# awesome
LIST=$LIST" galculator "

#----------------------

# for gnome and unity, allow resize with right button
echo "Allow gnome resize with right mouse button"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

# add spotify to sources.list
#echo "Adding Spotify repo and key"
#echo ""
#echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
#apt-get update

clear

#echo "Upgrading existing packages before install..."
#echo ""
#apt-get upgrade
#echo ""
#sleep 2s
echo ""
#apt-get dist-upgrade
#echo ""
sleep 2s
#---------------------
clear
echo "Installing package list..."
echo "$LIST"
apt-get install $LIST
echo ""
