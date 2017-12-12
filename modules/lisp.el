;;; lisp.el --- Lisp IDE Configuration

;;; Commentary:
;; Lisp IDE Configuration

;;; Code:



(defun my/lisp-mode-hook ()
  "Lisp Mode Hook with Slime."
  (if (= (shell-command "which sbcl") 0)
      (setq inferior-lisp-program (shell-command-to-string "which sbcl"))
    (if (= (shell-command "which clisp") 0)
        (setq inferior-lisp-program (shell-command-to-string "which clisp"))
      ()))
  (add-to-list 'company-backends 'slime-company)
  (setq slime-contribs '(slime-fancy))
  (slime-setup '(slime-fancy slime-company))
  (autopair-mode))

(add-hook 'lisp-mode-hook 'my/lisp-mode-hook)

;;; lisp.el ends here
