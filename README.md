[![GitHub license](https://img.shields.io/github/license/lillypad/emacs-lillypad.svg)](https://github.com/lillypad/emacs-lillypad/blob/master/LICENSE)
[![Python 2](https://img.shields.io/badge/Python-2-brightgreen.svg)](https://github.com/lillypad/emacs-lillypad/)
[![Python 3](https://img.shields.io/badge/Python-3-brightgreen.svg)](https://github.com/lillypad/emacs-lillypad/)
[![npm](https://img.shields.io/npm/v/npm.svg)]()
[![PyPI](https://img.shields.io/pypi/v/nine.svg)]()
[![GitHub issues](https://img.shields.io/github/issues/lillypad/emacs.d.svg)](https://github.com/lillypad/emacs.d/issues)

# lillypad's emacs.d

An Emacs Configuration for Humans

# Table of Contents
- [`Dependencies`](#dependencies)
- [`Quick Installation`](#quick-installation)
- [`Manual Installation`](#manual-installation)
- [`Screenshots`](#screenshots)
- [`Features`](#features)
- [`Keybindings`](#keybindings)


# Quick Installation
```bash
curl -s https://raw.githubusercontent.com/lillypad/emacs.d/master/setup.sh | bash
```

Once in emacs do: `M-x jedi:install-server RET`.

# Screenshots
![Screenshot](img/emacs-lillypad.png)

# Features
- Autocompletion
- Syntax Checking
- Snippets
- Rainbow Delimiters
- Powerline
- Magit
- Spell Check
- Git Diff
- Slime
  - sbcl
  - clisp
- ActionScript
- Snort Major Mode

# Dependencies
- [`python`](https://www.python.org/)
- [`npm`](https://www.npmjs.com/)
- [`nodejs`](https://nodejs.org/en/)
- [`clang`](https://clang.llvm.org/get_started.html)
- [`git`](https://git-scm.com/documentation)
- [`pip`](https://pip.pypa.io/en/stable/)

# Manual Installation

__Ubuntu / Debian__
```bash
sudo apt-get install -y emacs \
    python \
    npm \
    nodejs \
    clang \
    git \
    python-pip
```

__Gentoo:__
```bash
sudo emerge --ask app-editors/emacs \
    dev-lang/python \
    dev-python/pip \
    net-libs/nodejs \
    sys-devel/clang
```

__Setup:__
```bash
mkdir -p ~/.golang/
export GOPATH=~/.golang
echo "GOPATH=~/.golang" >> ~/.bashrc
go get -u github.com/nsf/gocode
sudo cp ~/.golang/bin/gocode /usr/bin/gocode
sudo ln -sf /usr/bin/nodejs /usr/bin/node
sudo npm install -g csslint jshint tern
git clone https://github.com/lillypad/emacs.d.git ~/.emacs.d/
cd ~/.emacs.d/
sudo pip install -r requirements.txt
cp .tern-config ~/.tern-config
cd ~
emacs
```

Once in emacs do: `M-x jedi:install-server RET`.

# Keybindings
- <kbd>CTRL</kbd>+<kbd>C</kbd> Copy
- <kbd>CTRL</kbd>+<kbd>X</kbd> Cut
- <kbd>CTRL</kbd>+<kbd>V</kbd> Paste
- <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>C</kbd> Comment Region
- <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>U</kbd> Uncomment Region
- <kbd>ALT</kbd>+<kbd>J</kbd> Expand Snippet
- <kbd>ALT</kbd>+<kbd>N</kbd> Next Snippet
- <kbd>CTRL</kbd>+<kbd>X</kbd> <kbd>G</kbd> Open Magit
- <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>S</kbd> Spell Checking
- <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>D</kbd> Git Diff
- <kbd>TAB</kbd> Completion Cycle Next
- <kbd>SHIFT</kbd>+<kbd>TAB</kbd> Completion Cycle Previous
