;;; theme.el --- Theme Configuration

;;; Commentary:
;; Theme Configuration

;;; Code:

(defun my/theme-setup ()
  "Custom Theme Setup Function."
  (cond
   ((string-equal system-type "windows-nt")
    (progn
      (message "Airline themes are unsupported in WinBlows...")))
   ((string-equal system-type "darwin")
    (progn
      (load-theme 'airline-serene t)
      (setq airline-eshell-colors t)
      (setq powerline-utf-8-separator-left        #xe0b0
            powerline-utf-8-separator-right       #xe0b2
            airline-utf-glyph-separator-left      #xe0b0
            airline-utf-glyph-separator-right     #xe0b2
            airline-utf-glyph-subseparator-left   #xe0b1
            airline-utf-glyph-subseparator-right  #xe0b3
            airline-utf-glyph-branch              #xe0a0
            airline-utf-glyph-readonly            #xe0a2
            airline-utf-glyph-linenumber          #xe0a1)))
   ((string-equal system-type "gnu/linux")
    (progn
      (load-theme 'airline-serene t)
      (setq airline-eshell-colors t)
      (setq powerline-utf-8-separator-left        #xe0b0
            powerline-utf-8-separator-right       #xe0b2
            airline-utf-glyph-separator-left      #xe0b0
            airline-utf-glyph-separator-right     #xe0b2
            airline-utf-glyph-subseparator-left   #xe0b1
            airline-utf-glyph-subseparator-right  #xe0b3
            airline-utf-glyph-branch              #xe0a0
            airline-utf-glyph-readonly            #xe0a2
            airline-utf-glyph-linenumber          #xe0a1))))
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  (setq dashboard-banner-logo-title "Anarchists Emacs")
  (setq dashboard-startup-banner "~/.emacs.d/img/anarchy.png")
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (set-face-background 'vertical-border "#404040")
  (set-face-attribute 'region nil :background "#666")
  (load-theme 'anarchy t)
  (global-linum-mode t)
  (set-face-foreground 'linum "#404040")
  (set-face-background 'linum "#000000")
  (setq linum-format "%4d \u2502 ")
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
  (if (display-graphic-p)
      (progn
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1))
    (menu-bar-mode -1)))

;;; theme.el ends here
