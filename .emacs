;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;------------lillypad Emacs Configuration--------------;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;------------------------------------------- Setup Notes--------------------------------------------------;;
;; sudo apt-get -y install python pip virtualenv npm nodejs pylint                                         ;;
;; sudo ln -s /usr/bin/nodejs /usr/bin/node                                                                ;;
;; sudo npm install -g csslint jshint                                                                      ;;
;; curl -LSso ~/.tern-config https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.tern-config ;;
;; curl -LSso ~/.emacs https://raw.githubusercontent.com/lillypad/emacs-lillypad/master/.emacs             ;;
;; emacs ~/.emacs                                                                                          ;;
;; M-x jedi:install-server RET                                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;---------Keybindings-------;;
;; C-c   -> Copy             ;;
;; C-x   -> Cut              ;;
;; C-v   -> Paste            ;;
;; C-M-c -> Comment Region   ;;
;; C-M-u -> Uncomment Region ;;
;; M-j   -> Expand Snippet   ;;
;; M-n   -> Next Snippet     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initial Setup Configuration
(require 'package)
(require 'cl)

;;;; Show Compile Buffer on Fatal Errors Only
(setq warning-minimum-level :emergency)

;;;; Initialize Package
(package-initialize)

;;;; Package Repos
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;;; Required Packages
(defvar required-packages
  '(
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

;;;; Check if Required Packages are Installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;;;; Install Packages if Missing
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;;; Require Packages
(dolist (p required-packages)
  (require p))

;;;; Auto Hide Compile Buffer if Successfull
(setq compilation-finish-functions
  (lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
      (progn
        (run-at-time "0.4 sec" nil
          (lambda ()
          (select-window (get-buffer-window (get-buffer-create "*compilation*")))
          (switch-to-buffer nil)))
          (message "No Compilation Errors!")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generic Configuration
(xterm-mouse-mode)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
    emacs-tmp-dir)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(menu-bar-mode -1)
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybinding Configuration
(global-set-key (kbd "C-M-c") 'comment-region)
(global-set-key (kbd "C-M-u") 'uncomment-region)
(global-set-key (kbd "M-j") 'yas-expand)
(global-set-key (kbd "M-n") 'yas-next-field-or-maybe-expand)
;;(global-set-key (kbd "M-o") 'yas-next-field-or-maybe-expand)
(global-set-key (kbd "M-o m") (kbd "RET"))
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-select-next)
     (define-key company-active-map [tab] 'company-select-next)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet Configuration
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck Configuration
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)
  '(add-hook 'flycheck-mode-hook 'flycheck-pycheckers-setup)
  '(add-hook 'flycheck-mode-hook 'css-csslint))
(eval-after-load 'flycheck
  (if (display-graphic-p)
      (flycheck-pos-tip-mode)
    (flycheck-popup-tip-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUA Configuration
(cua-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PopWin Configuration
(popwin-mode 1)
(push "*company-documentation*" popwin:special-display-config)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme Configuration
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(load-theme 'airline-doom-molokai t)
(load-theme 'badwolf t)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HideShow Configuration

;;;; Hideshow Default Hook
(add-hook 'prog-mode-hook 'hs-org/minor-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indent Guides Configuration
(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(highlight-indent-guides-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Global Company Settings

;;;; Company Default Hook
(add-hook 'after-init-hook 'global-company-mode)

;;;; Company Quickhelp if Window System Available
(when (display-graphic-p)
  (company-quickhelp-mode 1))

;;;; Company Autocomplete Settings
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 20)
(setq company-tooltip-align-annotations t)

;;;; Company Enable Yasnippet Backends
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown IDE Configuration
(add-hook 'markdown-mode-hook
  (lambda ()
    (when buffer-file-name
      (add-hook 'after-save-hook
        'check-parens
        nil t))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure IDE Configuration
(defun my/clojure-mode-hook ()
  (autopair-mode)
  (rainbow-delimiters-mode))
(add-hook 'clojure-mode-hook 'my/clojure-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common Lisp IDE Configuration
(defun my/lisp-mode-hook ()
  (autopair-mode))
(add-hook 'lisp-mode-hook 'my/lisp-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C IDE Configuration

;;;; Set C Basic Offset
(setq c-basic-offset 2)

;;;; Initialize Company C Headers
(add-to-list 'company-backends 'company-c-headers)

;;;; Setup CMake File Types
(setq auto-mode-alist
          (append
           '(("CMakeLists\\.txt\\'" . cmake-mode))
           '(("\\.cmake\\'" . cmake-mode))
           auto-mode-alist))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Python IDE Configuration
(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 4)
(defun my/python-mode-hook ()
  (autopair-mode)
  (setq tab-width 4)
  (setq jedi:complete-on-dot t)
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Javascript IDE Configuration

;;;; Initialisation
(mapc (lambda(p) (require p)) '(js2-mode tern company company-tern jquery-doc js2-refactor))
(jquery-doc-setup)
(add-to-list 'company-backends 'company-tern)

;;;; Associate js with tern and company
(add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)(autopair-mode)(tern-mode t)(company-mode t)))
;; use js2 as default mode
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;; Jquery documentation
;;; NB. update doc database with M-x jquery-doc-fetch-and-generate-data
(defun jquery-doc-at-point ()
  (interactive)
  (jquery-doc (thing-at-point 'word)))
(global-set-key [f2] 'jquery-doc-at-point)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    (autopair yasnippet-snippets flycheck flycheck-popup-tip flycheck-pycheckers popwin popup js2-refactor jquery-doc company tern js2-mode zone-rainbow zone-nyan rainbow-delimiters markdown-mode highlight-indent-guides hideshowvis hideshow-org company-tern company-rtags company-quickhelp company-jedi company-c-headers cmake-mode clojure-mode badwolf-theme airline-themes))))
