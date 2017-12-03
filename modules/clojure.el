;;; clojure.el --- Clojure Mode Configuration

;;; Commentary:
;; Clojure IDE Configuration

;;; Code:

(defun my/clojure-mode-hook ()
  (autopair-mode)
  (rainbow-delimiters-mode))
(add-hook 'clojure-mode-hook 'my/clojure-mode-hook)

;;; clojure.el ends here
