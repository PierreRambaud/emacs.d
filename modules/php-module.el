;;; php-module.el --- Php module

;;; Commentary:

;; Php module

;;; Code:

(require 'cl-lib)
(require 'phpunit)
(require 'php-mode)
(require 'php-doc-block)
(require 'flymake-php)
(require 'flymake-phpcs)
(require 'feature-mode)
(require 'php-mode)
(require 'phpactor)

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(setq phpunit-stop-on-failure t)
(setq phpunit-colorize "auto")
(setq phpunit-program "./vendor/bin/phpunit")

(provide 'php-module)

;;; php-module.el ends here
