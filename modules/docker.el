;;; docker.el --- Docker Configuration

;;; Commentary:
;; Docker Configuration

;;; Code:

(defun my/dockerfile-mode-hook ()
  "Dockerfile Mode Hook."
  (dolist (p required-packages-docker)
    (require p))
  (setq indent-tabs-mode t))

(add-hook 'dockerfile-mode-hook 'my/dockerfile-mode-hook)

;;; docker.el ends here
