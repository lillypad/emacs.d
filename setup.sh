#!/bin/bash
sudo apt-get install -y emacs python npm nodejs clang git python-pip
sudo ln -sf /usr/bin/nodejs /usr/bin/node
sudo npm install -g csslint jshint tern
git clone https://github.com/lillypad/emacs-lillypad.git
cd emacs-lillypad/
sudo pip install -r requirements.txt
cp -r .emacs.d ~/.emacs.d
cp .emacs ~/.emacs
cp .tern-config ~/.tern-config
cd ~
emacs
