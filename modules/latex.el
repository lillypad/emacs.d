;;; latex.el --- Latex Configuration

;;; Commentary:
;; Latex Configuration

;;; Code:

(defun my/latex-mode-hook ()
  "Latex Mode Hook."
  (dolist (p required-packages-latex)
    (require p))
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (setq-default TeX-master nil)
  (add-to-list 'company-backends 'company-auctex)
  (autopair-mode))

(add-hook 'TeX-mode-hook 'my/latex-mode-hook)
(add-hook 'TeX-mode-hook 'flyspell-mode)

;;; latex.el ends here
