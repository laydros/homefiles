#! /bin/sh
export LC_CTYPE=en_US.UTF-8
export TERM=xterm
if (test "$#" -eq "0")
then
    echo "test true"
else
    echo "test false"
fi
