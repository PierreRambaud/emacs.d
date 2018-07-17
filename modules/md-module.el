;;; md-module.el --- Markdown module

;;; Commentary:

;; Markdown module

;;; Code:

(add-hook 'markdown-mode-hook (lambda ()
                                (make-local-variable 'before-save-hook)
                                (remove-hook 'before-save-hook 'delete-trailing-whitespace t)
                                (define-key markdown-mode-map (kbd "C-c C-c p") 'markdown-preview-with-hf)))

(setq markdown-xhtml-header-content "<meta charset='utf-8'>")

(defun markdown-preview-with-hf (&optional output-buffer-name)
  "Run `markdown' on the current buffer and preview the output 'OUTPUT-BUFFER-NAME' in a browser."
  (interactive)
  (browse-url-of-buffer (markdown-standalone markdown-output-buffer-name)))

(provide 'md-module)

;;; md-module.el ends here
