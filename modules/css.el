;;; css.el --- CSS Configuration

;;; Commentary:
;; CSS Configuration

;;; Code:

(defun my/css-mode-hook ()
  "CSS Mode Hook."
  (rainbow-mode)
  (autopair-mode))

(add-hook 'css-mode-hook 'my/css-mode-hook)

;;; css.el ends here
