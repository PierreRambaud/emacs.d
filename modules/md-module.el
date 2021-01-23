
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

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(provide 'md-module)

;;; md-module.el ends here
