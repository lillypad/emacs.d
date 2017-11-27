;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure IDE Configuration
(defun my/clojure-mode-hook ()
  (autopair-mode)
  (rainbow-delimiters-mode))
(add-hook 'clojure-mode-hook 'my/clojure-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
