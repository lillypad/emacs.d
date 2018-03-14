;;; elixir.el --- Elixir Configuration

;;; Commentary:
;; Elixir Configuration

;;; Code:

(add-to-list 'company-backends 'alchemist-company)

(defun my/elixir-mode-hook ()
  "Elixir Programming Mode Hook."
  (autopair-mode))

(add-hook 'elixir-mode-hook 'my/elixir-mode-hook)

;;; elixir.el ends here
