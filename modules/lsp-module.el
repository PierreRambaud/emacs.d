;;; lsp-module.el

;;; Commentary:

;; Lsp module

;;; Code:

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-peek-always-show t)
  (setq lsp-auto-configure t)

  (setq lsp-clients-typescript-max-ts-server-memory 512)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-log-io nil) ;; Don't log everything = speed
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-ui-doc-webkit t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-javascript-display-property-declaration-type-hints t)
  (setq lsp-javascript-display-return-type-hints t)
  (setq lsp-eslint-auto-fix-on-save t)
  (setq lsp-eslint-lint-task-enable t)
  (setq lsp-restart 'auto-restart)

  :hook (
         (web-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (php-mode . lsp-deferred)
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

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))

(use-package which-key
    :config
    (which-key-mode))

;; lsp-mode

(provide 'lsp-module)

;;; lsp-module.el ends here
