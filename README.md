# emacs-lillypad

emacs-lillypad is my emacs configuration which allows new users to get used to emacs quickly without a difficult setup

# Screenshots
![Screenshot](img/emacs-lillypad.png)

# Features
- Autocompletion
- Syntax Checking
- Snippets
- Rainbow Delimiters

# Installation

Manual:
```bash
sudo apt-get install -y emacs python pip virtualenv npm nodejs pylint clang
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g csslint jshint
curl -LSso ~/.tern-config https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.tern-config && curl -LSso ~/.emacs https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.emacs && emacs
```

Automatic:
```bash
curl -s https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/setup.sh | bash
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
