#!/bin/bash

f=$(mktemp -u screenshot_XXXXXX.png)
import /tmp/$f
scp /tmp/$f linode:/var/www/html/public/images/
rm /tmp/$f
url="http://www.laydros.net/images/$f"
echo $url | xclip
echo $url | xclip -sel c
echo $url
