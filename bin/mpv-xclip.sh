$!/bin/bash

notify-send -t 3000 --icon=video-television "Playing Video" "$(xclip -o)";
# --fs -fullscreen
# --ytdl-format=22 is 720p
mpv --ytdl-format=22 --fs "$(xclip -o)" || mpv --fs "$(xclip -o)"
