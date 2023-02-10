;;; git-module.el --- Git module

;;; Commentary:

;; Git module

;;; Code:

(require 'git-commit)
(require 'magit)
(require 'magit-gitflow)
(add-hook 'magit-flow-hook 'turn-on-magit-gitflow)

(require 'git-gutter)
(git-gutter:linum-setup)
(global-git-gutter-mode t)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(set-face-background 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;; diff-hl
(require 'diff-hl)
(global-diff-hl-mode +1)
;; (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(global-set-key (kbd "C-c g g") 'browse-at-remote)

(require 'browse-at-remote)

(provide 'git-module)
;;; git-module.el ends here
