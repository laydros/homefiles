#!/bin/sh

OUTPUT=`asusctl profile -p | awk '{print $4}'`

TOSHOW="err"

case $OUTPUT in
    "Quiet")
        TOSHOW="quiet";;
    "Balanced")
        TOSHOW="bal";;
    "Performance")
        TOSHOW="perf";;
esac

echo $TOSHOW
