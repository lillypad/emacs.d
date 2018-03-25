;;; clojure.el --- Clojure Mode Configuration

;;; Commentary:
;; Clojure IDE Configuration

;;; Code:

(defun my/clojure-mode-hook ()
  (dolist (p required-packages-clojure)
    (require p))
  (paredit-mode)
  (rainbow-delimiters-mode))

(add-hook 'clojure-mode-hook 'my/clojure-mode-hook)

;;; clojure.el ends here
