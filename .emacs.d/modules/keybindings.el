;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybinding Configuration
(global-set-key (kbd "C-M-c") 'comment-region)
(global-set-key (kbd "C-M-u") 'uncomment-region)
(global-set-key (kbd "M-j") 'yas-expand)
(global-set-key (kbd "M-n") 'yas-next-field-or-maybe-expand)
;;(global-set-key (kbd "M-o") 'yas-next-field-or-maybe-expand)
(global-set-key (kbd "M-o m") (kbd "RET"))
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-select-next)
     (define-key company-active-map [tab] 'company-select-next)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
