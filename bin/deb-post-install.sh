#! /bin/sh

SOURCES_LIST=""

# List of packages to install
LIST=""

# firmware (must have non-free enabled)
#LIST=$LIST" intel-microcode firmware-linux"



# media players
# LIST=$LIST" vlc mpv"
LIST=$LIST" mpv"

# media codecs
#LIST=$LIST" gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly libavcodec-extra "

# cli utils
LIST=$LIST" mg freerdp2-x11"
LIST=$LIST" curl wget git neovim ncdu"

# common dev tools
# LIST=$LIST" geany diffuse autokey-gtk"
LIST=$LIST" gitk meld build-essential debian-keyring"
LIST=$LIST" gdb automake autoconf gnu-standards"

# python
# LIST=$LIST" python-pip python-rope python-dev"

# shell stuff
# LIST=$LIST" rxvt-unicode-256color"
LIST=$LIST" zsh tmux htop"

# archive
# LIST=$LIST" p7zip unace-nonfree unrar unzip zip cifs-utils"

# allow debian to install ppas
# LIST=$LIST" software-properties-common"

# keyboard
# LIST=$LIST" xbindkeys"

# dropbox
# LIST=$LIST" thunar-dropbox-plugin"
LIST=$LIST" nautilus-dropbox"

# graphics
LIST=$LIST" gimp"

# fonts
LIST=$LIST" fonts-powerline fonts-dejavu ttf-mscorefonts-installer xfonts-terminus"
LIST=$LIST" fonts-firacode fonts-glasstty fonts-go fonts-hack fonts-ibm-plex"
LIST=$LIST" fonts-inconsolata fonts-roboto"
# ubuntu only
#LIST=$LIST" ubuntu-restricted-extras"
# gnome only
LIST=$LIST" gnome-tweaks gnome-sushi "

# awesome
LIST=$LIST" galculator "

#----------------------

# for gnome and unity, allow resize with right button
#echo "Allow gnome resize with right mouse button"
#gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true


apt-get update

clear

echo "Upgrading existing packages before install..."
echo ""
apt-get -y upgrade
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
