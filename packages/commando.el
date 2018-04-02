;;; commando.el --- Collection of Useful Emacs Functions

;;; Commentary:
;; Collection of Useful Emacs Functions

;;; Code:

(defun commando-kill-all-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

;;; commando.el ends here
