;;; elisp.el --- Emacs Lisp Configuration

;;; Commentary:
;; Emacs Lisp Configuration

;;; Code:


(defun my/emacs-lisp-mode-hook ()
  "ELisp Mode Hook."
  (autopair-mode))

(add-hook 'emacs-lisp-mode-hook 'my/emacs-lisp-mode-hook)

;;; elisp.el ends here
