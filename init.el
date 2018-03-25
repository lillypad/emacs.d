;;; init.el --- An Emacs Configuration for Humans

;; Author: Lilly Chalupowski
;; URL: http://github.com/lillypad/emacs.d

;; The MIT License (MIT)

;; Copyright (C) 2017 Lilly Chalupowski

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;; Description: An Emacs Configuration for Humans
;; Author: Lilly Chalupowski

;;; Code:

(require 'cl)
(require 'package)

(setq warning-minimum-level :emergency)

(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defvar required-packages
  '(rainbow-mode
    hydra
    helm-swoop
    emmet-mode
    neotree
    ruby-mode
    rust-mode
    web-mode
    projectile
    helm
    helm-projectile
    eshell
    xterm-color
    elixir-mode
    elixir-yasnippets
    alchemist
    powershell
    actionscript-mode
    yara-mode
    go-mode
    company-go
    slime
    slime-company
    magit
    php-mode
    flycheck
    flycheck-pycheckers
    flycheck-popup-tip
    markdown-mode
    autopair
    js2-mode
    tern
    yasnippet
    yasnippet-snippets
    popwin
    pos-tip
    json-mode
    company
    company-quickhelp
    company-tern
    company-jedi
    company-c-headers
    company-php
    clojure-mode
    cmake-mode
    jedi-core
    hideshow-org
    hideshowvis
    rainbow-delimiters
    powerline
    airline-themes
    highlight-indent-guides
    jquery-doc
    js2-refactor))

(defvar required-packages-core
  '(rainbow-mode
    hydra
    helm-swoop
    neotree
    projectile
    helm
    helm-projectile
    helm-config
    eshell
    xterm-color
    magit
    flycheck
    flycheck-popup-tip
    autopair
    yasnippet
    yasnippet-snippets
    popwin
    pos-tip
    company
    company-quickhelp
    company-tern
    hideshow-org
    hideshowvis
    rainbow-delimiters
    powerline
    airline-themes
    highlight-indent-guides))

(defvar required-packages-ruby '(ruby-mode))

(defvar required-packages-rust '(rust-mode))

(defvar required-packages-web '(web-mode emmet-mode))

(defvar required-packages-clojure '(clojure-mode))

(defvar required-packages-php '(php-mode company-php))

(defvar required-packages-powershell '(powershell))

(defvar required-packages-yara '(yara-mode))

(defvar required-packages-markdown '(markdown-mode))

(defvar required-packages-actionscript '(actionscript-mode))

(defvar required-packages-js '(json-mode js2-refactor js2-mode tern jquery-doc company-tern))

(defvar required-packages-go '(go-mode company-go))

(defvar required-packages-c '(company-c-headers cmake-mode))

(defvar required-packages-python '(jedi-core company-jedi flycheck-pycheckers))

(defvar required-packages-elixir '(elixir-mode elixir-yasnippets alchemist))

(defvar required-packages-lisp '(slime slime-company))

(defun packages-installed-p ()
  "Install package-list if not installed."
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(dolist (p required-packages-core)
  (require p))

(load "~/.emacs.d/packages/anarchy-theme.el")
(load "~/.emacs.d/packages/hydra-helm.el")

(setq compilation-finish-functions
  (lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
      (progn
        (run-at-time "0.4 sec" nil
          (lambda ()
          (select-window (get-buffer-window (get-buffer-create "*compilation*")))
          (switch-to-buffer nil)))
          (message "No Compilation Errors!")))))

(defun load-directory (dir)
  "DIR: Directory to load user configuration modules."
  (let ((load-it (lambda (f)
    (load-file (concat (file-name-as-directory dir) f)))
    ))
  (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory "~/.emacs.d/modules/")
