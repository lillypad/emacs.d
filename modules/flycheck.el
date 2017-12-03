;;; flycheck.el --- Flycheck Configuration

;;; Commentary:
;; Flycheck Configuration

;;; Code:

(global-flycheck-mode 1)
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)
  '(add-hook 'flycheck-mode-hook 'flycheck-pycheckers-setup)
  '(add-hook 'flycheck-mode-hook 'css-csslint))
(eval-after-load 'flycheck
  (if (display-graphic-p)
      (flycheck-pos-tip-mode)
    (flycheck-popup-tip-mode)))

;;; flycheck.el ends here
