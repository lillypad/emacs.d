#!/bin/bash
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
EMERGE_CMD=$(which emerge)
PACMAN_CMD=$(which pacman)
if [[ ! -z $YUM_CMD ]]; then
    sudo yum -y install emacs \
         python \
         npm \
         nodejs \
         clang \
         git \
         python-pip \
         golang-go \
         elixir
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get install -y emacs \
         python \
         npm \
         nodejs \
         clang \
         git \
         python-pip \
         golang-go \
         elixir \
         rustc \
         cargo
elif [[ ! -z $EMERGE_CMD ]]; then
    sudo emerge --ask app-editors/emacs \
         dev-lang/python \
         dev-python/pip \
         net-libs/nodejs \
         sys-devel/clang \
         dev-lang/go \
         dev-lang/elixir \
         dev-lang/rust
elif [[ ! -z $PACMAN_CMD ]]; then
    sudo pacman --noconfirm -S emacs \
         python \
         npm \
         nodejs \
         clang \
         git \
         python-pip \
         golang-go \
         elixir \
         rustc \
         cargo
else
   echo "Unable to Detect Supported Package Manager!"
   exit 1;
fi

mkdir -p ~/.golang/
export GOPATH=~/.golang
echo "GOPATH=~/.golang" >> ~/.bashrc
go get -u github.com/nsf/gocode
sudo cp ~/.golang/bin/gocode /usr/bin/gocode
sudo ln -sf /usr/bin/nodejs /usr/bin/node
sudo npm install -g csslint jshint tern
git clone https://github.com/lillypad/emacs.d.git ~/.emacs.d/
cd .emacs.d/
pip install --user -r requirements.txt
cp .tern-config ~/.tern-config
make
cd ~
emacs
