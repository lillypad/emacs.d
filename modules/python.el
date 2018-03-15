;;; python.el --- Python IDE Configuration

;;; Commentary:
;; Python IDE Configuration

;;; Code:

(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 4)
(defun my/python-mode-hook ()
  "Python Hook Configuration."
  (dolist (p required-packages-python)
    (require p))
  (autopair-mode)
  (setq tab-width 4)
  (setq jedi:complete-on-dot t)
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;;; python.el ends here
