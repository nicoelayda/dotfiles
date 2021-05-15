#!/usr/bin/env sh

# update.sh
# Run this to update dotfiles repository with the contents of
# the current user's home directory.

rsync -avhz --include-from="update-list.txt" ~/ .
