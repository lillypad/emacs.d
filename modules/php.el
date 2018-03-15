;;; php.el --- PHP IDE Configuration

;;; Commentary:
;; PHP IDE Configuration

;;; Code:

(defun my/php-mode-hook ()
  "PHP Hook Configuration."
  (dolist (p required-packages-php)
    (require p))
  (add-to-list 'company-backends 'company-ac-php-backend))

(add-hook 'php-mode-hook 'my/php-mode-hook)

;;; php.el ends here
