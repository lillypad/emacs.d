;;; elixir.el --- Elixir Configuration

;;; Commentary:
;; Elixir Configuration

;;; Code:

(defun my/elixir-mode-hook ()
  "Elixir Programming Mode Hook."
  (dolist (p required-packages-elixir)
    (require p))
  (add-to-list 'company-backends 'alchemist-company)
  (autopair-mode))

(add-hook 'elixir-mode-hook 'my/elixir-mode-hook)

;;; elixir.el ends here
