#!/usr/bin/env bash

APT_GET_CMD=$(which apt-get)
EMERGE_CMD=$(which emerge)
PACMAN_CMD=$(which pacman)
BREW_CMD=$(which brew)

git clone https://github.com/lillypad/emacs.d.git ~/.emacs.d/

cd ~/.emacs.d/

if [[ ! -z $APT_GET_CMD ]]; then
    make ubuntu
elif [[ ! -z $EMERGE_CMD ]]; then
    make gentoo
elif [[ ! -z $PACMAN_CMD ]]; then
    make arch
elif [[ ! -z $BREW_CMD ]]; then
    make osx
else
   echo "Unable to Detect Supported Package Manager!"
   exit 1;
fi

make install
