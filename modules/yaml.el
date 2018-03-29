;;; yaml.el --- Yaml Configuration

;;; Commentary:
;; Yaml Configuration

;;; Code:

(defun my/yaml-mode-hook ()
  "Yaml Mode Hook."
  (dolist (p required-packages-yaml)
    (require p)))

(add-hook 'yaml-mode-hook 'my/yaml-mode-hook)

;;; yaml.el ends here
