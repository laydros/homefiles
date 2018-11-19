#!/bin/sh
#
# https://www.romanzolotarev.com/bin/screenshot
# Copyright 2018 Roman Zolotarev <hi@romanzolotarev.com>
#
# pkg_add slop ImageMagick sxiv xclip
#
set -e

dir="$HOME/downloads/screen/"

area="$(slop -o)"
date="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$dir"
output="$dir/${date}-$area.png"
import -window root -crop "$area" "$output"
[ -n "$1" ] && convert -scale "${1}%" "$output" "$output"
xclip -selection c -t image/png -i "$output"
num=$(find "$dir"|wc -l)
sxiv -Ztoprn "$num" "$dir" | xargs rm
