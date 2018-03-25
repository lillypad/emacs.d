;;; elisp.el --- Emacs Lisp Configuration

;;; Commentary:
;; Emacs Lisp Configuration

;;; Code:

(defun my/emacs-lisp-mode-hook ()
  "ELisp Mode Hook."
  (dolist (p required-packages-elisp)
    (require p))
  (paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'my/emacs-lisp-mode-hook)

;;; elisp.el ends here
