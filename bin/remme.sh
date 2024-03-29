#!/bin/bash
# remind me, its important!
# usage: remme
# adapted from: http://usalug.org/phpBB2/viewtopic.php?t=13209&sid=a641eb81eff1925e714a2fc6576e8a13
title="Remind Me:"
message="${@:2}"

if [[ "${1:0:1}" == "@" ]]
then
    echo "notify-send --icon=dialog-information \"$title\" \"$message\"" | at "${1:1}"
else
    sleep "$1" && notify-send --icon=dialog-information "$title" "$message" &
fi
