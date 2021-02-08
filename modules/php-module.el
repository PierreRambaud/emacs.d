;;; php-module.el --- Php module

;;; Commentary:

;; Php module

;;; Code:

(require 'cl-lib)
(require 'php-eldoc)
(require 'eldoc)
(require 'php-mode)
(require 'php-doc-block)
(require 'flymake-php)
(require 'flymake-phpcs)
(require 'feature-mode)

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-hook 'php-mode-hook (lambda ()
                           (require 'company-php)
                           (company-mode t)
                           (local-set-key (kbd "<C-tab>") 'php-doc-block)
                           (ac-php-core-eldoc-setup)
                           (make-local-variable 'company-backends)
                           (add-to-list 'company-backends 'company-ac-php-backend)
                           (subword-mode)
                           (flymake-php-load)
                           (c-set-offset 'case-label '+)
                           (define-key php-mode-map (kbd "RET") 'newline-and-indent)))
(setq flycheck-phpcs-standard "PSR2")
(setq phpunit-stop-on-failure t)
(setq phpunit-colorize "auto")
(setq phpunit-program "./bin/phpunit")


(provide 'php-module)

;;; php-module.el ends here
