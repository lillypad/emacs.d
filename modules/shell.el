;;; shell.el --- Shell Configuration

;;; Commentary:
;; Shell Configuration

;;; Code:

(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
          (lambda () (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

(add-hook 'eshell-before-prompt-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))

(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline t)

(defun my/eshell-mode-hook ()
  "Eshell Mode Hook."
  (global-hl-line-mode 0)
  (set-face-attribute hl-line-face nill :underline nil))

(add-hook 'eshell-mode-hook 'my/eshell-mode-hook)

;;; shell.el ends here
