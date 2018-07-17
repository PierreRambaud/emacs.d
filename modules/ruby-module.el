;;; ruby-module.el --- Ruby module

;;; Commentary:

;; Ruby module

;;; Code:

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . ruby-mode))
(add-to-list 'completion-ignored-extensions ".rbc")

(eval-after-load 'ruby-mode
  '(progn
     (defun prelude-ruby-mode-defaults ()
       (subword-mode +1))
     (setq prelude-ruby-mode-hook 'prelude-ruby-mode-defaults)
     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'prelude-ruby-mode-hook)))))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(provide 'ruby-module)

;;; ruby-module.el ends here
