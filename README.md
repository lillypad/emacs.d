[![GitHub license](https://img.shields.io/github/license/lillypad/emacs-lillypad.svg)](https://github.com/lillypad/emacs-lillypad/blob/master/LICENSE)
[![Python 2](https://img.shields.io/badge/Python-2-brightgreen.svg)](https://github.com/lillypad/emacs-lillypad/)
[![Python 3](https://img.shields.io/badge/Python-3-brightgreen.svg)](https://github.com/lillypad/emacs-lillypad/)
[![npm](https://img.shields.io/npm/v/npm.svg)]()
[![PyPI](https://img.shields.io/pypi/v/nine.svg)]()
[![GitHub issues](https://img.shields.io/github/issues/lillypad/emacs.d.svg)](https://github.com/lillypad/emacs.d/issues)

# lillypad's emacs.d

:sparkles: An Emacs Configuration for Humans :sparkles:

# Table of Contents
- [`Quick Installation`](#quick-installation)
- [`Screenshots`](#screenshots)
- [`Features`](#features)
- [`Supported Languages`](#supported-languages)
- [`Dependencies`](#dependencies)
- [`Manual Installation`](#manual-installation)
- [`Keybindings`](#keybindings)
- [`Feature Requests`](#feature-requests)
- [`Contributing`](#contributing)
- [`Special Thanks`](#special-thanks)


# Quick Installation

Run this one command and you are done! :stuck_out_tongue_winking_eye:


```bash
curl -s https://raw.githubusercontent.com/lillypad/emacs.d/master/setup.sh | bash
```

Once in emacs do: `M-x jedi:install-server RET`.

# Screenshots
![Screenshot](img/emacs-lillypad.png)

# Features
- Package Load Optimization
- Autocompletion
- Syntax Checking
- Snippets
- Rainbow Delimiters
- Powerline
- Magit
- Spell Check
- Git Diff
- Slime
- Alchemist

# Supported Languages:
- Lisp
- Clojure
- PHP
- ActionScript
- Suricata IDS/IPS
- Snort IDS/IPS
- Yara
- Powershell
- Elixir
- Golang
- C with Clang
- C++ with Clang
- Python
- Javascript
- JSON
- Markdown

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
    python-pip \
    golang-go \
    elixir
```

__Gentoo:__
```bash
sudo emerge --ask app-editors/emacs \
    dev-lang/python \
    dev-python/pip \
    net-libs/nodejs \
    sys-devel/clang \
    dev-lang/go \
    dev-lang/elixir
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
- <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>X</kbd> <kbd>S</kbd> Start Emacs Server

# Feature Requests:
Add a feature request under issues and I may be able to add it in.

# Contributing
I will accept pull requests after reviewing them.

# Special Thanks
- [oblivia-simplex](https://github.com/oblivia-simplex)
  - Converted me from Vim to Emacs
- [BobuSumisu](sobuSumisu/snort-mode)
  - Creator of `snort-mode` (I've added a few improvements)

If you like this project buy me a drink :wine_glass:
