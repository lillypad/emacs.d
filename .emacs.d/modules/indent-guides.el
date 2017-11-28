;;; indent-guides.el --- indent-guides configuration

;;; Commentary:
;; indent-guides configuration

;;; Code:

(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(highlight-indent-guides-mode t)

;;; indent-guides.el ends here
