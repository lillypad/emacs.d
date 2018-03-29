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
	pip install --user -r requirements.txt

deps_ubuntu:
	sudo apt-get install -y python \
		npm \
		nodejs \
		git \
		python-pip \
		golang-go \
		elixir \
		rustc \
		cargo
	sudo pip install -r requirements.txt
	sudo npm install -g csslint jshint tern
	sudo ln -sf /usr/bin/nodejs /usr/bin/node

deps_arch:
	sudo pacman --noconrim -S python \
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

clean:
	rm -rf elpa/
	rm -rf auto-save-list/
	rm -rf snippets/
	rm -rf eshell/
	rm -f projectile-bookmarks.eld
