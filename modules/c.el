;;; c.el --- C Mode Configuration

;;; Commentary:
;; C Programming IDE

;;; Code:

(add-to-list 'company-backends 'company-c-headers)

(defun my/c-mode-common-hook ()
  (setq c-basic-offset 2)
  (setq auto-mode-alist
        (append
         '(("CMakeLists\\.txt\\'" . cmake-mode))
         '(("\\.cmake\\'" . cmake-mode))
         auto-mode-alist)))

;;; c.el ends here
