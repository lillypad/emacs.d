;;; lisp.el --- Lisp IDE Configuration

;;; Commentary:
;; Lisp IDE Configuration

;;; Code:

(defun my/lisp-mode-hook ()
  (autopair-mode))
(add-hook 'lisp-mode-hook 'my/lisp-mode-hook)

;;; lisp.el ends here
