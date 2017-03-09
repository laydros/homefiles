#! /bin/sh

SOURCES_LIST=""

# List of packages to install
LIST=""

# firmware (must have non-free enabled)
#LIST=$LIST" intel-microcode firmware-linux"

# media players
LIST=$LIST" vlc spotify-client"

# media codecs
#LIST=$LIST" gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly libavcodec-extra "

# browser plugins
#LIST=$LIST" flashplugin-nonfree"

# cli utils
LIST=$LIST" curl wget git vim ncdu freerdp-x11"

# common dev tools
LIST=$LIST" geany gitk xbindkeys diffuse autokey-gtk build-essential"

# python
LIST=$LIST" python-pip python-rope python-dev"

# shell stuff
LIST=$LIST" rxvt-unicode-256color zsh tmux"

# archive
LIST=$LIST" p7zip unace-nonfree unrar unzip zip cifs-utils"

# allow debian to install ppas
#LIST=$LIST" software-properties-common python-software-properties "

# keyboard
LIST=$LIST" xbindkeys"

# graphics
#LIST=$LIST" gimp gtk2-engines-murrine"

# fonts
LIST=$LIST" ttf-bitstream-vera ttf-dejavu ttf-freefont ttf-mscorefonts-installer ttf-liberation xfonts-terminus"

# Diodon clipboard manager
#LIST=$LIST" diodon diodon-plugins"

# Parcellite clibboard manager
#LIST=$LIST" parcellite"

# libre office style - need to set with Tools->Options->LibreOffice->View
# select sifr under "Icon size and style"
#LIST=$LIST" libreoffice-style-sifr "

# ubuntu only
#LIST=$LIST" unity-tweak-tool ubuntu-restricted-extras gnome-sushi "

# awesome
LIST=$LIST" galculator "

#----------------------

# for gnome and unity, allow resize with right button
#echo "Allow gnome resize with right mouse button"
#gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

# add spotify to sources.list
echo "Adding Spotify repo and key"
echo ""
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list


# add enpass to sources.list
echo "Adding Enpass repo and key"
echo ""
wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add -
echo "deb http://repo.sinew.in/ stable main" > \
      /etc/apt/sources.list.d/enpass.list



apt-get update

clear

echo "Upgrading existing packages before install..."
echo ""
apt-get upgrade
echo ""
sleep 2s
echo ""
apt-get dist-upgrade
echo ""
sleep 2s
#---------------------
clear
echo "Installing package list..."
echo "$LIST"
apt-get install $LIST
echo ""

#echo "Now that zsh and curl are installed, grabbing oh-my-zsh"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Go install source code pro: https://github.com/adobe-fonts/source-code-pro"
echo "mkdir -p ~/.fonts"
echo "move OpenType fonts (.otf) or TrueType files (.ttf) to ~/.fonts"
echo "sudo fc-cache"
