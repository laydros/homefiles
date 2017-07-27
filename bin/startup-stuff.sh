#!/bin/bash

$HOME/bin/caps-to-ctrl.sh
xrdb -load $HOME/.Xresources
killall sxhkd
sxhkd &
#xbindkeys_autostart
