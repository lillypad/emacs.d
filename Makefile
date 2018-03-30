emacs ?= emacs

PORTAGE_UNMASK=/etc/portage/package.unmask
PORTAGE_ACCEPT=/etc/portage/package.accept_keywords

.PHONY: gentoo
.PHONY: ubuntu
.PHONY: arch
.PHONY: windows
.PHONY: test
.PHONY: all

all: build

gentoo: deps_gentoo build

ubuntu: deps_ubuntu build

arch: deps_arch build

windows: deps_windows build

test: clean build

deps_gentoo:
	sudo emerge --quiet --sync
	echo "app-editors/emacs" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-lang/python" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-python/pip" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "net-libs/nodejs" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "sys-devel/clang" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-lang/go" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-lang/elixir" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-lang/rust" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-lisp/clisp" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "dev-util/cargo" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	echo "virtual/rust" | sudo tee -a ${PORTAGE_UNMASK} ${PORTAGE_ACCEPT}
	sudo emerge --quiet app-editors/emacs \
		dev-lang/python \
		dev-python/pip \
		net-libs/nodejs \
		sys-devel/clang \
		dev-lang/go \
		dev-lang/elixir \
		dev-lang/rust \
		dev-lisp/clisp
	pip install --user -r requirements.txt
	sudo npm install -g csslint jshint tern

deps_ubuntu:
	sudo add-apt-repository ppa:ubuntu-elisp/ppa
	sudo apt-get update
	sudo apt-get install -qq emacs-snapshot \
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

deps_arch:
	sudo pacman --noconfirm --quiet -S emacs \
		python \
		npm \
		nodejs \
		clang \
		git \
		python-pip \
		go \
		elixir \
		rust \
		clisp
	sudo pip install -r requirements.txt
	sudo npm install -g csslint jshint tern

deps_windows:
	choco install -y git \
		emacs \
		python \
		nodejs \
		golang \
		clisp \
		rust \
		elixir
	pip install -r requirements.txt
	npm install -g csslint jshint tern

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
