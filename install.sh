#!/usr/bin/env sh

# install.sh
# Run this to install dotfiles to the current user's directory.

rsync -avhz --include-from="install-list.txt" . ~
