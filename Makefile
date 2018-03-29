.PHONY: all
.PHONY: test

all: build open

open:
	emacs

test: clean build

build:
	emacs --batch -l init.el

clean:
	rm -rf elpa/
	rm -rf auto-save-list/
	rm -rf snippets/
	rm -rf eshell/
	rm -f projectile-bookmarks.eld
