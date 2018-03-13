;;; actionscript.el --- ActionScript Configuration

;;; Commentary:
;; ActionScript Configuration

;;; Code:

(defun my/actionscript-mode-hook ()
  "ActionScript Programming Mode Hook."
  (autopair-mode))

(add-hook 'actionscript-mode-hook 'my/actionscript-mode-hook)

;;; actionscript.el ends here
