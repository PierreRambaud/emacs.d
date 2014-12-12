;;; skbd.el --- This is a minor mode to manage my personal kbd map
;;
;; Author: Sliim <sliim@mailoo.org>
;; Version: 1.0.0
;; Keywords: keybindings

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Sliim personal keybindings

(defgroup skbd nil
  "GoT personal keybindings"
  :group 'projext)

(defvar skbd-keymap-prefix (kbd "C-o")
  "Skbd keymap prefix.")

(defvar skbd-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key prefix-map (kbd "h c") 'helm-stumpwm-commands)
      (define-key prefix-map (kbd "h g") 'helm-ls-git-ls)
      (define-key prefix-map (kbd "h f") 'helm-find-files)
      (define-key prefix-map (kbd "h q") 'helm-quickrun)
      (define-key prefix-map (kbd "h w") 'helm-swoop)
      (define-key prefix-map (kbd "h r") 'helm-git-grep)
      (define-key prefix-map (kbd "h y") 'helm-c-yas-complete)
      (define-key prefix-map (kbd "p i") 'projext-show-current-project)
      (define-key prefix-map (kbd "p t") 'projext-regenerate-tags)
      (define-key prefix-map (kbd "p c t") 'projext-clean-project-tags)
      (define-key prefix-map (kbd "p c d") 'projext-clean-project-desktop)
      (define-key prefix-map (kbd "p c a") 'projext-clean-project)
      (define-key prefix-map (kbd "p f") 'projext-find)
      (define-key prefix-map (kbd "p s") 'project-persist-save)
      (define-key prefix-map (kbd "p k") 'project-persist-close)
      (define-key prefix-map (kbd "p d") 'direx-project:jump-to-project-root-other-window)
      (define-key prefix-map (kbd "p n") 'project-persist-create)
      (define-key prefix-map (kbd "p h") 'helm-project-persist)
      (define-key prefix-map (kbd "p x") 'project-persist-delete)
      (define-key prefix-map (kbd "f n") 'flymake-goto-next-error)
      (define-key prefix-map (kbd "f p") 'flymake-goto-prev-error)
      (define-key prefix-map (kbd "q q") 'quickrun)
      (define-key prefix-map (kbd "q e") 'quickrun-region)
      (define-key prefix-map (kbd "q a") 'quickrun-with-arg)
      (define-key prefix-map (kbd "q s") 'quickrun-shell)
      (define-key prefix-map (kbd "q r") 'quickrun-replace-region)
      (define-key prefix-map (kbd "g s") 'magit-status)
      (define-key prefix-map (kbd "g l") 'magit-log)
      (define-key prefix-map (kbd "m b") 'mc/edit-beginnings-of-lines)
      (define-key prefix-map (kbd "m e") 'mc/edit-ends-of-lines)
      (define-key prefix-map (kbd "m E") 'mc/edit-lines)
      (define-key prefix-map (kbd "m >") 'mc/mark-next-like-this)
      (define-key prefix-map (kbd "m <") 'mc/mark-previous-like-this)
      (define-key prefix-map (kbd "m a") 'mc/mark-all-like-this)
      (define-key prefix-map (kbd "m n") 'mc/mark-next-lines)
      (define-key prefix-map (kbd "m p") 'mc/mark-previous-lines)
      (define-key prefix-map (kbd "r i") 'yari-helm)
      (define-key prefix-map (kbd "C-o") 'direx:display-item)
      (define-key prefix-map (kbd "w") 'whitespace-mode)
      (define-key prefix-map (kbd "i") 'iedit-mode)
      (define-key prefix-map (kbd "b") 'helm-buffers-right-side)
      (define-key prefix-map (kbd "k") 'set-cmd-to-kbd)
      (define-key prefix-map (kbd "d") 'direx:jump-to-directory-other-window)
      (define-key prefix-map (kbd "P") 'proced)
      (define-key prefix-map (kbd "s") 'eshell)

      (define-key map skbd-keymap-prefix prefix-map))
    map)
  "Keymap for Skbd mode.")

(define-globalized-minor-mode skbd-global-mode
  skbd-mode
  skbd-mode 1)

(define-minor-mode skbd-mode
  "Keybindings map."
  :lighter " Skbd"
  :keymap skbd-mode-map
  :group 'skbd)

(provide 'skbd)
