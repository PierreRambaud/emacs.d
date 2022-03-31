;;; lsp-module.el

;;; Commentary:

;; Lsp module

;;; Code:

(require 'lsp)
(require 'lsp-ui)

;; lsp-mode
(setq lsp-log-io nil) ;; Don't log everything = speed
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)

(add-hook 'web-mode-hook #'lsp-deferred)
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)

(provide 'lsp-module)

;;; lsp-module.el ends here
