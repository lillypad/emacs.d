;;; c.el --- C Mode Configuration

;;; Commentary:
;; C Programming IDE

;;; Code:

(defun my/c-mode-common-hook ()
  "C Programming Mode Hook."
  (dolist (p required-packages-c)
    (require p))
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "/usr/src/linux/include")
  (autopair-mode)
  (setq c-basic-offset 2)
  (setq auto-mode-alist
        (append
         '(("CMakeLists\\.txt\\'" . cmake-mode))
         '(("\\.cmake\\'" . cmake-mode))
         auto-mode-alist)))

(add-hook 'c-mode-hook 'my/c-mode-common-hook)

;;; c.el ends here
