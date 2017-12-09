;;; company.el --- Company Configuration

;;; Commentary:
;; Description: Company Configuration

;;; Code:


(add-hook 'after-init-hook 'global-company-mode)

(when (display-graphic-p)
  (company-quickhelp-mode 1))

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 20)
(setq company-tooltip-align-annotations t)

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  "BACKEND: Company mode support for Yasnippet."
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;;; company.el ends here
