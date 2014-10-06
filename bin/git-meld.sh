#!/bin/bash

# Add the following lines to your ~/.gitconfig file to use Meld as your diff
# tool of choice.
#
# [diff]
# external = /home/bdill/bin/git-meld.sh

meld $2 $5
