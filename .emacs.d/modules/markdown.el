;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown IDE Configuration
(add-hook 'markdown-mode-hook
  (lambda ()
    (when buffer-file-name
      (add-hook 'after-save-hook
        'check-parens
        nil t))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
