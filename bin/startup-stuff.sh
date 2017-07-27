#!/bin/bash

$HOME/bin/caps-to-ctrl.sh
xrdb -merge $HOME/.Xresources
killall sxhkd
sxhkd &
#xbindkeys_autostart
