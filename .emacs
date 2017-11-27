;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;------------lillypad Emacs Configuration--------------;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initial Setup Configuration
(require 'package)
(require 'cl)

;;;; Show Compile Buffer on Fatal Errors Only
(setq warning-minimum-level :emergency)

;;;; Initialize Package
(package-initialize)

;;;; Package Repos
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;;; Required Packages
(defvar required-packages
  '(
    flycheck
    flycheck-pycheckers
    flycheck-popup-tip
    markdown-mode
    autopair
    js2-mode
    tern
    yasnippet
    yasnippet-snippets
    popwin
    pos-tip
    json-mode
    company
    company-quickhelp
    company-tern
    company-jedi
    company-c-headers
    clojure-mode
    cmake-mode
    jedi-core
    hideshow-org
    hideshowvis
    rainbow-delimiters
    powerline
    airline-themes
    badwolf-theme
    highlight-indent-guides
    jquery-doc
    js2-refactor
    ))

;;;; Check if Required Packages are Installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;;;; Install Packages if Missing
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;;; Require Packages
(dolist (p required-packages)
  (require p))

;;;; Auto Hide Compile Buffer if Successfull
(setq compilation-finish-functions
  (lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
      (progn
        (run-at-time "0.4 sec" nil
          (lambda ()
          (select-window (get-buffer-window (get-buffer-create "*compilation*")))
          (switch-to-buffer nil)))
          (message "No Compilation Errors!")))))

;;;; Load User Modules
(defun load-directory (dir)
  (let ((load-it (lambda (f)
    (load-file (concat (file-name-as-directory dir) f)))
    ))
  (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/modules/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(package-selected-packages
   (quote
    (autopair yasnippet-snippets flycheck flycheck-popup-tip flycheck-pycheckers popwin popup js2-refactor jquery-doc company tern js2-mode zone-rainbow zone-nyan rainbow-delimiters markdown-mode highlight-indent-guides hideshowvis hideshow-org company-tern company-rtags company-quickhelp company-jedi company-c-headers cmake-mode clojure-mode badwolf-theme airline-themes))))
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
