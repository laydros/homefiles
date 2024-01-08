#!/bin/sh

OUTPUT=`supergfxctl -S`

TOSHOW="err"

case $OUTPUT in
    "suspended")
        TOSHOW="sus";;
    "active")
        TOSHOW="act";;
    "blah")
        TOSHOW="blah";;
esac

echo $TOSHOW
