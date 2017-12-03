;;; js.el --- JavaScript IDE Configuration

;;; Commentary:
;; JavaScript IDE Configuration

;;; Code:

(mapc (lambda(p) (require p)) '(js2-mode tern company company-tern jquery-doc js2-refactor))
(jquery-doc-setup)
(add-to-list 'company-backends 'company-tern)

;;;; Associate js with tern and company
(add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)(autopair-mode)(tern-mode t)(company-mode t)))
;; use js2 as default mode
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;; Jquery documentation
;;; NB. update doc database with M-x jquery-doc-fetch-and-generate-data
(defun jquery-doc-at-point ()
  (interactive)
  (jquery-doc (thing-at-point 'word)))
(global-set-key [f2] 'jquery-doc-at-point)

;;; js.el ends here
