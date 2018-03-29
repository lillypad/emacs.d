emacs ?= emacs

.PHONY: gentoo
.PHONY: ubuntu
.PHONY: arch
.PHONY: test

gentoo: deps_gentoo build

ubuntu: deps_ubuntu build

arch: deps_arch build

test: clean build

deps_gentoo:
	sudo emerge --sync
	sudo emerge --ask app-editors/emacs \
		dev-lang/python \
		dev-python/pip \
		net-libs/nodejs \
		sys-devel/clang \
		dev-lang/go \
		dev-lang/elixir \
		dev-lang/rust
	pip install --user -r requirements.txt

deps_ubuntu:
	sudo add-apt-repository ppa:ubuntu-elisp/ppa
	sudo apt-get update
	sudo apt-get install -y emacs-snapshot \
		python \
		python-virtualenv \
		npm \
		nodejs \
		git \
		python-pip \
		golang-go \
		rustc \
		cargo \
		wget
	wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
	rm -f erlang-solutions_1.0_all.deb
	sudo pip install -r requirements.txt
	sudo npm install -g csslint jshint tern
	sudo ln -sf /usr/bin/nodejs /usr/bin/node

deps_arch:
	sudo pacman --noconrim -S emacs \
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
	sudo pip install -r requirements.txt
	sudo npm install -g csslint jshint tern
	sudo ln -sf /usr/bin/nodejs /usr/bin/node

build:
	emacs --batch -l init.el
	emacs --batch -l init.el --eval '(jedi:install-server)'

install:
	mkdir -p ~/.golang/
	export GOPATH=~/.golang
	echo "GOPATH=~/.golang" >> ~/.bashrc
	go get -u ~/.golang/bin/gocode /usr/bin/gocode
	cp .tern-config ~/.tern-config

clean:
	rm -rf elpa/
	rm -rf auto-save-list/
	rm -rf snippets/
	rm -rf eshell/
	rm -f projectile-bookmarks.eld
