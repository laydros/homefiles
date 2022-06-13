#!/bin/sh
# A bash script for a post netinstall of packages on Debian Wheezy.
# You should be logged in as root!
#------------------------------------------------------------
clear
echo "This script has been designed by Stanie to run after"
echo "netinstall installation of Debian Wheezy. It installs"
echo "preferred package set based around the Openbox WM."
echo "Feel free to check it and make any adjustments you want."
echo "!!!Choose either Wheezy or Sid repos (Default = Sid)!!!"
echo ""
echo -n "Run installer now? (Y|n) > "
read a
if [ "$a" = "y" ] || [ "$a" = "Y" ] || \
[ "$a" = "" ]; then
#Set Repositories
#--------
    if [ -f /etc/apt/sources.list ]; then
        cp -f /etc/apt/sources.list /etc/apt/sources.list.original
    fi
    echo "## DEBIAN" > /etc/apt/sources.list
    echo "deb http://ftp.de.debian.org/debian/ sid main contrib non-free" >> /etc/apt/sources.list
    echo "# deb http://ftp.de.debian.org/debian/ wheezy main contrib non-free" >> /etc/apt/sources.list
    echo "" >> /etc/apt/sources.list
    echo "## DEBIAN SECURITY" >> /etc/apt/sources.list
    echo "# deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list
    echo "" >> /etc/apt/sources.list
    echo "## DEBIAN MULTIMEDIA" >> /etc/apt/sources.list
    echo "# deb http://www.deb-multimedia.org sid main non-free" >> /etc/apt/sources.list
    echo "# deb http://www.deb-multimedia.org wheezy main non-free" >> /etc/apt/sources.list
    echo "" >> /etc/apt/sources.list
    echo "" >> /etc/apt/sources.list
    echo "## CRUNCHBANG (Compatible with Debian Squeeze)" >> /etc/apt/sources.list
    echo "deb http://packages.crunchbang.org/statler statler main" >> /etc/apt/sources.list
    sleep 2s
#Add Keyrings
#---------------
clear
echo "Adding keyrings before upgrade..."
sleep 2s
wget http://packages.crunchbang.org/statler-dev/crunchbang.key
sleep 2s
apt-key add crunchbang.key
sleep 2s
wget http://deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2012.05.05_all.deb
sleep 2s
dpkg -i deb-multimedia-keyring_2012.05.05_all.deb
sleep 2s
echo ""
echo "keyrings added..."
echo ""
sleep 2s
#Update Repositories
#---------------
clear
echo "Upgrading new repositories before install..."
echo ""
apt-get update
echo ""
echo "All packages updated..."
echo ""
sleep 2s
#Perform Upgrade
#---------------
clear
echo "Upgrading existing packages before install..."
echo ""
apt-get dist-upgrade
echo ""
echo "All packages upgraded..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing base packages..."
echo ""
sleep 2s
apt-get install xorg gdm xfce4-notifyd xfce4-power-manager xfce4-screenshooter xfce4-taskmanager catfish gksu gdebi fakeroot checkinstall terminator ntp synaptic apt-xapian-index disk-manager ntfs-3g gparted gufw bleachbit bash-completion screen figlet whois rpl zenity xfsprogs reiserfsprogs reiser4progs avahi-utils binutils jfsutils debian-keyring firmware-linux firmware-iwlwifi
echo ""
echo "All base packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Openbox packages and #! goodies..."
echo ""
sleep 2s
apt-get install lxinput lxappearance scrot viewnior openbox obconf obmenu obapps gmrun suckless-tools tint2 gsimplecal fbxkb nitrogen crunchbang-bin-scripts crunchbang-configs
echo ""
echo "All Openbox packages and #! goodies installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing File Manager & Archivers..."
echo ""
sleep 2s
apt-get install thunar thunar-archive-plugin thunar-media-tags-plugin ffmpegthumbnailer arj bzip2 lha lzop lbzip2 p7zip p7zip-full p7zip-rar plzip rzip unace-nonfree unalz unrar unzip xz-utils zip zoo
echo ""
echo "All File Manager & Archivers installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Audio/Video packages..."
echo ""
sleep 2s
apt-get install alsa-base xfce4-mixer volumeicon-alsa gstreamer0.10-alsa gstreamer0.10-plugins-bad gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly audacious audacity easytag vlc
echo ""
echo "All Audio/Video packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Graphics & Themes packages..."
echo ""
sleep 2s
apt-get install gimp gcolor2 inkscape ttf-bitstream-vera ttf-dejavu ttf-freefont ttf-mscorefonts-installer oxygencursors gtk2-engines-murrine elementary-icon-theme
echo ""
echo "All Graphics & Themes packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Network packages..."
echo ""
sleep 2s
apt-get install deluge chromium-browser chromium-l10n network-manager-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-vpnc-gnome xchat
echo ""
echo "All Network packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Office packages..."
echo ""
sleep 2s
apt-get install epdfview galculator geany geany-plugins libreoffice libreoffice-gtk
echo ""
echo "All Office packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing Misc packages..."
echo ""
sleep 2s
apt-get install apt-listbugs assogiate conky conky-all kupfer parcellite rcconf secure-delete wipe clamav
echo ""
echo "All Misc packages installed..."
echo ""
sleep 2s
#------------------------------------
clear
echo "Installing packages without recommends..."
echo ""
sleep 2s
apt-get --no-install-recommends install file-roller
echo ""
echo "All packages installed..."
echo ""
sleep 2s

#Clean up downloaded packages
#----------------------------
clear
echo ""
echo "Clean up..."
sleep 1s
apt-get clean


#Prompt for reboot
#-----------------
clear
echo "Installation complete!"
echo "You will now need to reboot your system."
echo ""
echo -n "Reboot now? (Y|n) > "
read a
if [ "$a" = "y" ] || [ "$a" = "Y" ] || \
[ "$a" = "" ]; then
echo "Goodbye."
echo "Rebooting..."
sleep 4s
reboot
exit
else
echo "Issue the following command as root to reboot:"
echo ""
echo "reboot"
echo ""
echo "Goodbye!"
fi
fi
exit
