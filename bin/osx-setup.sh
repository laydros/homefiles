#! /bin/bash

# A script to set up a new mac. Uses bash, homebrew, etc.

# Focused for ruby/rails development. Includes many utilities and apps:
# - homebrew, rvm, node
# - quicklook plugins, terminal fonts
# - browsers: chrome, firefox
# - dev: iterm2, sublime text, postgres, chrome devtools, etc.
# - team: slack, dropbox, google drive, skype, etc
# - utils: unarchiver, o-day, caffine, skitch, etc
# - productivity: evernote, viscosity, omnigraffle, karabiner, etc.


# Settings
node_version="0.12.2"

# helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# requirements
cd ~
mkdir -p tmp
echo_warn "setting permissions..."
for dir in "/usr/local /usr/local/bin /usr/local/include /usr/local/lib /usr/local/share"; do
	sudo chgrp admin $dir
	sudo chmod g+w $dir
done

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
	echo_ok "Homebrew already installed"
else
    echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# moar homebrew...
brew install caskroom/cask/brew-cask
brew update && brew cleanup && brew cask cleanup

# brew taps
brew tap caskroom/versions
brew tap caskroom/fonts

# Homebrew base
brew install \
  autoconf automake bash-completion cowsay curl ffmpeg figlet \
  gettext git go gpg freetype htop-osx jq libxml2 \
  mobile-shell mpv python python3 readline \
  sqlite ssh-copy-id unrar v8 wget xz youtube-dl zsh

# brew cask fonts
echo_warn "Installing fonts..."
brew cask install \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-hack font-hack-nerd-font font-hack-nerd-font-mono \
  font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-iosevka font-iosevka-nerd-font font-iosevka-nerd-font-mono \
  font-raleway font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro


# brew cask quicklook
echo_warn "Installing QuickLook Plugins..."
brew cask install \
	qlcolorcode qlmarkdown qlprettypatch qlstephen \
	qlimagesize \
	quicklook-csv quicklook-json epubquicklook

# Apps
echo_warn "Installing applications..."

# google
brew cask install google-chrome
# other favorites
brew cask install \
  adium alfred bartender bettertouchtool burn caffeine cloak \
  dropbox enpass firefox gimp hazel iterm2 karabiner \
  mattermost minecraft node ruby \
  sequel-pro spotify sublime-text-dev \
  the-unarchiver transmission transmit tunnelblick vlc
  # adafruit-arduino

# xquartz
echo_warn "Installing xquartz (this big download can be slow)"
n=0
until [ $n -ge 20 ]; do
	brew cask install xquartz && break
	n=$[$n+1]
	echo_error "... install failed, retry $n"
done

# brew imagemagick
brew cask install inkscape
brew install librsvg
brew install imagemagick --with-librsvg

echo
echo_ok "Done."
echo
echo "After Dropbox has finished installing, link Sublime Text settings:"
echo_warn "  cd ~/Library/Application\ Support/Sublime\ Text\ 3/"
echo_warn "  rm -rf Packages"
echo_warn "  ln -s ~/Dropbox/Sublime/Packages ."
echo
echo "You may want to add the following settings to your .bashrc:"
echo_warn '  export HOMEBREW_CASK_OPTS="--appdir=/Applications"'
echo
