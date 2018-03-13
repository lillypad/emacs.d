;;; snort.el --- Snort Configuration

;;; Commentary:
;; Golang Configuration

;;; Code:

(defun my/snort-mode-hook ()
  "Snort Mode Hook."
  (snort-mode)
  (autopair-mode))

(add-hook 'snort-mode-hook 'my/snort-mode-hook)

(setq auto-mode-alist (append '(("\\.rules$" . snort-mode))
      auto-mode-alist))

;;; snort.el ends here
