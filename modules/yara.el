;;; yara.el --- Yara Configuration

;;; Commentary:
;; Python IDE Configuration

;;; Code:

(defun my/yara-mode-hook()
  (autopair-mode))
(add-hook 'yara-mode-hook 'my/yara-mode-hook)

;;; yara.el ends here
