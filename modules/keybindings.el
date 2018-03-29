;;; keybindings.el --- Keybinding Configuration

;;; Commentary:
;; Keybinding Configuration

;;; Code:

(defun my/keybindings ()
  "Custom Keybindings."
  (global-set-key (kbd "M-c") 'comment-region)
  (global-set-key (kbd "M-u") 'uncomment-region)
  (global-set-key (kbd "C-M-s") 'ispell)
  (global-set-key (kbd "C-M-d") 'magit-ediff-compare)
  (global-set-key (kbd "M-j") 'yas-expand)
  (global-set-key (kbd "M-n") 'yas-next-field-or-maybe-expand)
  (global-set-key (kbd "M-o m") (kbd "RET"))
  (global-set-key (kbd "M-O n") (kbd "."))
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x p") 'package-list-packages)
  (global-set-key (kbd "C-x t") 'eshell)
  (global-set-key (kbd "C-M-x s") 'server-start)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x f") 'neotree-toggle)
  (global-set-key (kbd "C-s") 'helm-swoop)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x q") 'delete-window)
  (global-set-key (kbd "C-x _") 'split-window-below)
  (global-set-key (kbd "C-x |") 'split-window-right)
  (global-set-key (kbd "C-c jc") 'ace-jump-char-mode)
  (global-set-key (kbd "C-c jw") 'ace-jump-word-mode)
  (global-set-key (kbd "C-c jl") 'ace-jump-line-mode)
  (defhydra hydra-navigator (global-map "C-c n")
    "Hydra Page Navigation"
    ("d" cua-scroll-up "Page Down")
    ("u" cua-scroll-down "Page Up")
    ("n" forward-line "Line Down")
    ("p" ibuffer-backward-line "Line Up")
    ("f" forward-char "Char Forward")
    ("b" backward-char "Char Backward")
    ("w" forward-word "Word Forward")
    ("s" backward-word "Word Backward")
    ("e" move-end-of-line "End of Line")
    ("a" move-beginning-of-line "Beginning of Line")
    ("q" keyboard-quit "Quit" :exit t)
    ("<escape>" keyboard-quit "Quit" :exit t))
  (eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-select-next)
     (define-key company-active-map [tab] 'company-select-next)
     (define-key company-active-map (kbd "<S-tab>") 'company-select-previous)
     (define-key company-active-map (kbd "<backtab>") 'company-select-previous))))

(my/keybindings)

;;; keybindings.el ends here
