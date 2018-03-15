;;; go.el --- Golang Configuration

;;; Commentary:
;; Golang Configuration

;;; Code:

(defun my/go-mode-hook ()
  "Golang Programming Mode Hook."
  (dolist (p required-packages-go)
    (require p))
  (add-to-list 'company-backends 'company-go)
  (autopair-mode))

(add-hook 'go-mode-hook 'my/go-mode-hook)

;;; go.el ends here
