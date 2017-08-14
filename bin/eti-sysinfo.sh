#!/bin/sh
# found from /u/eti_f
#                           ██            ████                
#                          ░░            ░██░                 
#   ██████  ██   ██  ██████ ██ ███████  ██████  ██████ 
#  ██░░░░  ░░██ ██  ██░░░░ ░██░░██░░░██░░░██░  ██░░░░██
# ░░█████   ░░███  ░░█████ ░██ ░██  ░██  ░██  ░██   ░██
#  ░░░░░██   ░██    ░░░░░██░██ ░██  ░██  ░██  ░██   ░██
#  ██████    ██     ██████ ░██ ███  ░██  ░██  ░░██████ 
# ░░░░░░   ██      ░░░░░░  ░░ ░░░   ░░   ░░    ░░░░░░  
#        ░░      
#

#█▓▒░ vars
#FULL=▓
#EMPTY=░
#FULL=+
#EMPTY=
#EMPTY=─
FULL=┅
EMPTY=┄

name=$USER
host=`hostname`
#distro="Arch Linux"
distro=`cat /etc/debian_version`
kernel=`uname -r`
pkgs=`pacman -Qqs | wc -l`
colors='take a color picker'
font='UW ttyp0'
wm='openbox'

#█▓▒░ progress bar 
draw()
{
  perc=$1
  size=$2
  inc=$(( perc * size / 100 ))
  out=
  if [ -z $3 ]
  then
    color="36"
  else
    color="$3"
  fi 
  for v in `seq 0 $(( size - 1 ))`; do
    test "$v" -le "$inc"   \
    && out="${out}\e[1;${color}m${FULL}" \
    || out="${out}\e[0;${color}m${EMPTY}"
  done
  printf $out
}

#█▓▒░ colors 
printf "\n"
i=0
while [ $i -le 6 ]
do
  printf " \e[$((i+41))m\e[$((i+30))m█▓▒░"
  i=$(($i+1))
done
printf "\e[37m█\e[0m▒░\n\n"


#█▓▒░ greets
printf " \e[0m\n"

#█▓▒░ environment
printf " \e[1;31m      distro \e[0m$distro\n"
printf " \e[1;31m      kernel \e[0m$kernel\n"
printf " \e[1;31m    packages \e[0m$pkgs\n"
printf " \e[1;31m          wm \e[0m$wm\n"
printf " \e[1;31m        font \e[0m$font\n"
printf " \e[1;31m      colors \e[0m$colors\n"
printf " \e[0m\n"

#█▓▒░ cpu
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
c_lvl=`printf "%.0f" $cpu`
#printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " cpu" "$c_lvl%" `draw $c_lvl 15` 

#█▓▒░ ram
ram=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
#printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " ram" "$ram%" `draw $ram 15` 
