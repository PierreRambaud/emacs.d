;;; lsp-module.el

;;; Commentary:

;; Lsp module

;;; Code:

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (web-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(use-package which-key
    :config
    (which-key-mode))

;; lsp-mode
(setq lsp-enable-file-watchers nil)
(setq lsp-log-io nil) ;; Don't log everything = speed
(setq lsp-keymap-prefix "C-c l")
(setq lsp-ui-doc-webkit t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)

(setq lsp-restart 'auto-restart)

(provide 'lsp-module)

;;; lsp-module.el ends here
