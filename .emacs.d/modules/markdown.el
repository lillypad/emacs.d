;;; markdown.el --- Markdown Mode Configuration

;;; Commentary:
;; Markdown Mode Configuration

;;; Code:

(add-hook 'markdown-mode-hook
  (lambda ()
    (when buffer-file-name
      (add-hook 'after-save-hook
        'check-parens
        nil t))))

;;; markdown.el ends here
