;;; emacs-lillypad --- An Emacs Configuration for Humans

;; Author: Lilly Chalupowski
;; URL: http://github.com/lillypad/emacs-lillypad

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

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(defvar required-packages
  '(
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
    badwolf-theme
    highlight-indent-guides
    jquery-doc
    js2-refactor
    ))

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

(dolist (p required-packages)
  (require p))

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
 '(custom-safe-themes
   (quote
    ("b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(package-selected-packages
   (quote
    (company-php php-mode autopair yasnippet-snippets flycheck flycheck-popup-tip flycheck-pycheckers popwin popup js2-refactor jquery-doc company tern js2-mode zone-rainbow zone-nyan rainbow-delimiters markdown-mode highlight-indent-guides hideshowvis hideshow-org company-tern company-rtags company-quickhelp company-jedi company-c-headers cmake-mode clojure-mode badwolf-theme airline-themes))))
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
