;;; git-module.el --- Git module

;;; Commentary:

;; Git module

;;; Code:

(require 'magit)
(require 'magit-gitflow)
(add-hook 'magit-flow-hook 'turn-on-magit-gitflow)


(require 'git-gutter)
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

(provide 'git-module)

;;; git-module.el ends here
