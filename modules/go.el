;;; go.el --- Golang Configuration

;;; Commentary:
;; Golang Configuration

;;; Code:

(add-to-list 'company-backends 'company-go)

(defun my/go-mode-hook ()
  "Golang Programming Mode Hook."
  (autopair-mode))

(add-hook 'go-mode-hook 'my/go-mode-hook)

;;; go.el ends here
