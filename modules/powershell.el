;;; powershell.el --- Powershell Configuration

;;; Commentary:
;; Powershell Configuration

;;; Code:

(defun my/powershell-mode-hook ()
  "Powershell Programming Mode Hook."
  (dolist (p required-packages-powershell)
    (require p))
  (autopair-mode))

(add-hook 'powershell-mode 'my/powershell-mode-hook)

;;; powershell.el ends here
