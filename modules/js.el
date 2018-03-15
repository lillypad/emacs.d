;;; js.el --- JavaScript IDE Configuration

;;; Commentary:
;; JavaScript IDE Configuration

;;; Code:

(defun my/js-mode-hook ()
  "Javascript Programming Mode Hook."
  (dolist (p required-packages-js)
    (require p))
  (setq tern-command (append tern-command '("--no-port-file")))
  (setq js-indent-level 2)
  (jquery-doc-setup)
  (tern-mode t)
  (company-mode t)
  (autopair-mode)
  (add-to-list 'company-backends 'company-tern)
  (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
  (defun jquery-doc-at-point ()
    (interactive)
    (jquery-doc (thing-at-point 'word)))
  (global-set-key [f2] 'jquery-doc-at-point))

(add-hook 'js-mode-hook 'my/js-mode-hook)

;;; js.el ends here
