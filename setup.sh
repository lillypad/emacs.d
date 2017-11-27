#!/bin/bash
sudo apt-get install -y emacs python pip virtualenv npm nodejs pylint clang
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g csslint jshint
curl -LSso ~/.tern-config https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.tern-config && curl -LSso ~/.emacs https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.emacs && emacs
