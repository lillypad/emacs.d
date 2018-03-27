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
  '(ivy
    paredit
    rainbow-mode
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
  '(ace-jump-mode
    ivy
    rainbow-mode
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

(defvar required-packages-elisp '(paredit))

(defvar required-packages-ruby '(ruby-mode))

(defvar required-packages-rust '(rust-mode))

(defvar required-packages-web '(web-mode emmet-mode))

(defvar required-packages-clojure '(clojure-mode paredit))

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

(defvar required-packages-lisp '(slime slime-company paredit))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function (quote split-window-horizontally))
 '(package-selected-packages
   (quote
    (ace-jump-mode ivy monochrome-theme paredit zone-nyan yasnippet-snippets yara-mode xterm-color web-mode ujelly-theme slime-company rust-mode ranger rainbow-mode rainbow-delimiters powershell popwin neotree molokai-theme markdown-mode magit json-mode js2-refactor jquery-doc hydra highlight-indent-guides hideshowvis hideshow-org helm-swoop helm-projectile flycheck-pycheckers flycheck-popup-tip emmet-mode elixir-yasnippets company-tern company-quickhelp company-php company-jedi company-go company-c-headers cmake-mode clojure-mode autopair alchemist airline-themes actionscript-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
