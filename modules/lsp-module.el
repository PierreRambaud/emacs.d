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
         (typescript-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-lens)
(use-package lsp-modeline)
(use-package lsp-headerline)
(use-package lsp-ui-sideline)
(use-package lsp-ui-peek)
(use-package lsp-ui-doc)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(setq lsp-auto-configure t)
(setq lsp-restart 'auto-restart)

(setq lsp-clients-typescript-max-ts-server-memory 1024)
(setq lsp-enable-file-watchers nil)
(setq lsp-log-io nil) ;; Don't log everything = speed

(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-webkit t)
(setq lsp-ui-peek-always-show t)
(setq lsp-ui-peek-enable t)

(setq lsp-javascript-suggest-complete-function-calls t)

(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)

(setq lsp-eslint-node-path "/opt/ndenv/shims/node")

(use-package which-key
  :config
  (which-key-mode))

;; lsp-mode

(provide 'lsp-module)

;;; lsp-module.el ends here
