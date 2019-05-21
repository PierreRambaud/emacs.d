;;; ruby-module.el --- Ruby module

;;; Commentary:

;; Ruby module

;;; Code:

(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . enh-ruby-mode))
(add-to-list 'completion-ignored-extensions ".rbc")

(require 'flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)

(provide 'ruby-module)

;;; ruby-module.el ends here
