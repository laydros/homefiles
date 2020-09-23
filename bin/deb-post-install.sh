#! /bin/sh

# TODO - create toggle for minimal or desktop install

SOURCES_LIST=""

# List of packages to install
LIST=""

# firmware (must have non-free enabled)
#LIST=$LIST" intel-microcode firmware-linux"


# media 
LIST=$LIST" mpv ffmpeg"
# bigger install
LIST=$LIST" vlc picard lollypop audacity soundconverter"

# media codecs
#LIST=$LIST" gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly libavcodec-extra "

# cli utils
LIST=$LIST" mg"
LIST=$LIST" curl wget git neovim ncdu"
# bigger install
LIST=$LIST" freerdp2-xll neovim stress s-tui"


# common dev tools
# LIST=$LIST" geany diffuse autokey-gtk"
LIST=$LIST" build-essential debian-keyring automake autoconf"
# bigger install
LIST=$LIST" gitk meld gdb gnu-standards"

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
#LIST=$LIST" nautilus-dropbox"
LIST=$LIST " nautilus-nextcloud"

# graphics
LIST=$LIST" feh"
# bigger install
LIST=$LIST" gimp imagemagick flameshot"

# PDF
LIST=$LIST" pdfarranger mupdf"

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

LIST=$LIST" torbrowser-launcher calibre clipit"

#----------------------

# add-apt-repository ppa:papirus/papirus # Papirus icon theme repo

# Get DEB files
# wget https://prerelease.keybase.io/keybase_amd64.deb
# wget https://atom.io/download/deb/atom-amd64.deb
# wget https://launcher.mojang.com/download/Minecraft.deb

# apt install adapta-gtk-theme -y
# apt install papirus-icon-theme -y
# apt install python3-pip -y

# Install snap packages
snap install spotify

# Install DEB files
# dpkg -i keybase_amd64.deb
# dpkg -i Minecraft.deb
# apt --fix-broken install -y # Fix Minecraft dependency issue.

# Clean up DEB files
# rm -f keybase_amd64.deb
# rm -f Minecraft.deb
# rm -f atom-amd64.deb

#############
# These don't work when using sudo. Must be run as user
############

# for gnome and unity, allow resize with right button
echo "Allow gnome resize with right mouse button, set alt as modifier"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

echo "Set gnome to use emacs style keybindings"
gsettings set org.gnome.desktop.interface gtk-key-theme 'Emacs'

echo 'Enable hot corner for overview'
gsettings set org.gnome.desktop.interface enable-hot-corners true

echo "Set gnome workspace and window management to a mix of pop-os and regolith style"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift><Alt>j', '<Super><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift><Alt>k', '<Super><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Primary><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Primary><Super>Up']"

gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Primary><Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right  "['<Primary><Super>Right']"

echo "Set some gnome launch shortcuts to regolith style"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super><Shift>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super><Shift>n']"

apt-get update

clear

echo "Upgrading existing packages before install..."
echo ""
apt-get -y upgrade
echo ""
sleep 2s
echo ""
#apt-get dist-upgrade
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
