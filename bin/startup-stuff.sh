#!/bin/bash

$HOME/bin/caps-to-ctrl.sh
xrdb -merge $HOME/.Xresources
xbindkeys_autostart
