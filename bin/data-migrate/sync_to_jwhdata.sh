#!/bin/bash

rsync -avhE -delete "/Users/laydros/Desktop" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/Downloads" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/Documents" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/code" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/Movies" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/Music" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
rsync -avhE -delete "/Users/laydros/Pictures" "/Volumes/rMBP13-TimeMachine/rmbp13-bak/"
