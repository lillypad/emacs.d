;;; generic.el --- Generic Configuration

;;; Commentary:
;; Generic Configuration

;;; Code:

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
(projectile-mode t)
(helm-projectile-on)
;;; generic.el ends here
