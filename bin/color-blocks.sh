#!/bin/sh
clear

echo
# DARK COLOR SCHEME
for y in $(seq 0 2); do
  printf %s '         '
  for color in 0 1 2 3 4 5 6 7; do
    tput setab ${color}
    printf %s '      '
  done
  tput sgr0
  echo
done
# LIGHT COLOR SCHEME
for y in $(seq 0 2); do
  printf %s '         '
  for color in 8 9 10 11 12 13 14 15; do
    tput setab ${color}
    printf %s '      '
  done
  tput sgr0
  echo
done

echo
