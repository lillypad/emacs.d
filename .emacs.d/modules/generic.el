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
