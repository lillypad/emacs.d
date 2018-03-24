;;; rust.el --- Rust Configuration

;;; Commentary:
;; Rust Configuration

;;; Code:

(defun my/rust-mode-hook ()
  "Rust Programming Hook."
  (dolist (p required-packages-rust)
    (require p))
  (autopair-mode))

(add-hook 'rust-mode-hook 'my/rust-mode-hook)

;;; rust.el ends here
