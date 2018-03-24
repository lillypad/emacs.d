;;; ruby.el --- Ruby Configuration

;;; Commentary:
;; Ruby COnfiguration

;;; Code:

(defun my/ruby-mode-hook ()
  "Ruby Programming Mode Hook."
  (dolist (p required-packages-ruby)
    (require p))
  (autopair-mode))

;;; ruby.el ends here
