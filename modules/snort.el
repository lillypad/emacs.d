;;; snort.el --- Snort Configuration

;;; Commentary:
;; Golang Configuration

;;; Code:

(setq auto-mode-alist (append '(("\\.rules$" . my/snort-mode-hook)) auto-mode-alist))

(defun my/snort-mode-hook ()
  "Snort Mode Hook."
  (load "~/.emacs.d/packages/snort-mode.el")
  (snort-mode)
  (autopair-mode))

(add-hook 'snort-mode-hook 'my/snort-mode-hook)

;;; snort.el ends here
