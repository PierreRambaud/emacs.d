;;; php-module.el --- Php module

;;; Commentary:

;; Php module

;;; Code:

(require 'cl-lib)
;; (require 'ac-php)
;; (require 'eldoc)
(require 'php-mode)
(require 'php-doc-block)
(require 'flymake-php)
(require 'flymake-phpcs)
(require 'feature-mode)
(require 'phpunit)
(require 'php-mode)
(require 'phpactor)

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-hook 'php-mode-hook (lambda ()
                           (require 'company-phpactor)
                           (require 'company-php)
                           (company-mode t)
                           (local-set-key (kbd "<C-tab>") 'php-doc-block)
                           ;; (ac-php-core-eldoc-setup)
                           (make-local-variable 'company-backends)
                           ;; (add-to-list 'company-backends 'company-ac-php-backend)
                           (add-to-list 'company-backends 'company-files)
                           (subword-mode)
                           (flymake-php-load)
                           (c-set-offset 'case-label '+)
                           (define-key php-mode-map (kbd "RET") 'newline-and-indent)))

(define-transient-command php-transient-menu ()
  "Php"
  [["Class"
    ("cc" "Copy" phpactor-copy-class)
    ("cn" "New" phpactor-create-new-class)
    ("cr" "Move" phpactor-move-class)
    ("ci" "Inflect" phpactor-inflect-class)
    ("n"  "Namespace" phpactor-fix-namespace)]
   ["Properties"
    ("a"  "Accessor" phpactor-generate-accessors)
    ("pc" "Constructor" phpactor-complete-constructor)
    ("pm" "Add missing props" phpactor-complete-properties)
    ("r" "Rename var locally" phpactor-rename-variable-local)
    ("R" "Rename var in file" phpactor-rename-variable-file)]
  ["Extract"
    ("ec" "constant" phpactor-extract-constant)
    ("ee" "expression" phpactor-extract-expression)
    ("em"  "method" phpactor-extract-method)]
  ["Methods"
    ("i" "Implement Contracts" phpactor-implement-contracts)
    ("m"  "Generate method" phpactor-generate-method)]
  ["Navigate"
    ("x" "List refs" phpactor-list-references)
    ("X" "Replace refs" phpactor-replace-references)
    ("."  "Goto def" phpactor-goto-definition)]
  ["Phpactor"
    ("s" "Status" phpactor-status)
    ("u" "Install" phpactor-install-or-update)]])

(setq phpunit-stop-on-failure t)
(setq phpunit-colorize "auto")
(setq phpunit-program "./vendor/bin/phpunit")

(provide 'php-module)

;;; php-module.el ends here
