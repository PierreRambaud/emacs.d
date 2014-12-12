(require 'helm)
(require 'helm-aliases)
(require 'helm-misc)
(require 'helm-files)
(require 'helm-ls-git)
(require 'helm-project-persist)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'helm-git-grep)
(require 'helm-c-yasnippet)

(setq helm-buffers-favorite-modes (quote (emacs-lisp-mode org-mode php-mode ruby-mode python-mode shell-script-mode))
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
