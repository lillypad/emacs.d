;;; markdown.el --- Markdown Mode Configuration

;;; Commentary:
;; Markdown Mode Configuration

;;; Code:

(defun my/markdown-mode-hook ()
  "Markdown."
  (when buffer-file-name (add-hook 'after-save-hook 'check-parens nil t)))

(add-hook 'markdown-mode-hook 'my/markdown-mode-hook)

;;; markdown.el ends here
