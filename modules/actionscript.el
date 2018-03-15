;;; actionscript.el --- ActionScript Configuration

;;; Commentary:
;; ActionScript Configuration

;;; Code:

(defun my/actionscript-mode-hook ()
  "ActionScript Programming Mode Hook."
  (dolist (p required-packages-actionscript)
    (require p))
  (autopair-mode))

(add-hook 'actionscript-mode-hook 'my/actionscript-mode-hook)

;;; actionscript.el ends here
