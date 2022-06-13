#!/bin/sh -eu
#
# deploy my website

cd /home/j3s/code/j3s.sh
if git fetch origin; then
    go build
    mv j3s.sh /usr/local/bin/j3s.sh
    service j3s.sh restart
fi
