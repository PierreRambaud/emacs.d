;;; helm-module.el --- Helm module

;;; Commentary:

;; Helm module

;;; Code:

(require 'helm)
(require 'helm-ag)
(require 'helm-misc)
(require 'helm-files)
(require 'helm-ls-git)
(require 'helm-project-persist)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'helm-mode)
(require 'helm-git-grep)
(require 'helm-c-yasnippet)
(require 'helm-descbinds)
(require 'helm-eshell)

(require 'helm-config)
(require 'helm-projectile)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
;; discussion of these options.
(setq helm-split-window-inside-p            t
      helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-ff-skip-boring-files             t
      helm-ff-file-name-history-use-recentf t)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)

(define-key helm-command-map (kbd "o")     'helm-occur)
(define-key helm-command-map (kbd "g")     'helm-do-grep)
(define-key helm-command-map (kbd "C-c w") 'helm-wikipedia-suggest)
(define-key helm-command-map (kbd "SPC")   'helm-all-mark-rings)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

;; shell history.
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))

(substitute-key-definition 'find-tag 'helm-etags-select global-map)
(setq projectile-completion-system 'helm)
(helm-descbinds-mode)
(helm-mode 1)

;; enable Helm version of Projectile with replacment commands
(helm-projectile-on)

(setq helm-buffers-favorite-modes (quote (emacs-lisp-mode php-mode enh-ruby-mode python-mode shell-script-mode org-mode))
      helm-follow-mode-persistent t)
(defun helm-buffers-right-side ()
  "Special helm settings to list buffers in right side."
  (interactive)
  (let ((initial-helm-split-window-default-side helm-split-window-default-side))
    (setq helm-split-window-default-side (quote right))
    (helm-buffers-list)
    (setq helm-split-window-default-side initial-helm-split-window-default-side)))
(defun helm-custom ()
  "Custom helm interface."
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-source-buffers-list
                         helm-source-recentf
                         helm-source-ls-git-status
                         helm-source-ls-git
                         helm-source-buffer-not-found)
                       "*helm custom*")))

(provide 'helm-module)

;;; helm-module.el ends here
