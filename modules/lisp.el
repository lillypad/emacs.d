;;; lisp.el --- Lisp IDE Configuration

;;; Commentary:
;; Lisp IDE Configuration

;;; Code:

(defun my/lisp-mode-hook ()
  "Lisp Mode Hook with Slime."
  (dolist (p required-packages-lisp)
    (require p))
  (if (= (shell-command "which sbcl") 0)
      (setq inferior-lisp-program (shell-command-to-string "which sbcl"))
    (if (= (shell-command "which clisp") 0)
        (setq inferior-lisp-program (shell-command-to-string "which clisp"))
      ()))
  (setq slime-contribs '(slime-fancy))
  (paredit-mode))

(add-hook 'lisp-mode-hook 'my/lisp-mode-hook)

;;; lisp.el ends here
