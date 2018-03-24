;;; web.el --- Web Configuration

;;; Commentary:
;; Web Configuration

;;; Code:

(add-to-list 'auto-mode-alist '("\\.html$" . my/web-mode-hook))
(add-to-list 'auto-mode-alist '("\\.htm$" . my/web-mode-hook))
(add-to-list 'auto-mode-alist '("\\.mht$" . my/web-mode-hook))
(add-to-list 'auto-mode-alist '("\\.mhtml$" . my/web-mode-hook))

(defun my/web-mode-hook ()
  "Web Mode Hook."
  (dolist (p required-packages-web)
    (require p))
  (web-mode)
  (emmet-mode))

(add-hook 'web-mode 'my/web-mode-hook)

;;; web.el ends here
