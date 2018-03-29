emacs ?= emacs

.PHONY: all
.PHONY: test

all: build

test: clean build

build:
	emacs --batch -l init.el
	emacs --batch -l init.el --eval '(jedi:install-server)'

clean:
	rm -rf elpa/
	rm -rf auto-save-list/
	rm -rf snippets/
	rm -rf eshell/
	rm -f projectile-bookmarks.eld
