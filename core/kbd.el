;;; kbd.el --- This is a minor mode to manage Key Binding

;;; Commentary:

;; Custom key binding

;;; Code:
(defgroup kbd nil
  "GoT personal keybindings"
  :group 'projext)

(defvar kbd-keymap-prefix (kbd "C-o")
  "Kbd keymap prefix.")

(defvar kbd-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key prefix-map (kbd "P") 'proced)
      (define-key prefix-map (kbd "a d") 'ansible::decrypt-buffer)
      (define-key prefix-map (kbd "a e") 'ansible::encrypt-buffer)
      (define-key prefix-map (kbd "b") 'helm-buffers-right-side)
      (define-key prefix-map (kbd "f e") 'lsp-eslint-apply-all-fixes)
      (define-key prefix-map (kbd "f n") 'flymake-goto-next-error)
      (define-key prefix-map (kbd "f p") 'flymake-goto-prev-error)
      (define-key prefix-map (kbd "g l") 'magit-log)
      (define-key prefix-map (kbd "g s") 'magit-status)
      (define-key prefix-map (kbd "g t") 'lsp-goto-type-definition)
      (define-key prefix-map (kbd "h g") 'helm-ls-git)
      (define-key prefix-map (kbd "h q") 'helm-quickrun)
      (define-key prefix-map (kbd "h r") 'helm-git-grep)
      (define-key prefix-map (kbd "h p") 'helm-projectile-grep)
      (define-key prefix-map (kbd "h w") 'helm-swoop)
      (define-key prefix-map (kbd "h y") 'helm-c-yas-complete)
      (define-key prefix-map (kbd "i") 'iedit-mode)
      (define-key prefix-map (kbd "j t") 'jest-test-run-at-point)
      (define-key prefix-map (kbd "j c") 'jest-test-run)
      (define-key prefix-map (kbd "u") 'narrow-or-widen-dwim)
      (define-key prefix-map (kbd "k") 'set-cmd-to-kbd)
      (define-key prefix-map (kbd "m <") 'mc/mark-previous-like-this)
      (define-key prefix-map (kbd "m >") 'mc/mark-next-like-this)
      (define-key prefix-map (kbd "m E") 'mc/edit-lines)
      (define-key prefix-map (kbd "m a") 'mc/mark-all-like-this)
      (define-key prefix-map (kbd "m b") 'mc/edit-beginnings-of-lines)
      (define-key prefix-map (kbd "m e") 'mc/edit-ends-of-lines)
      (define-key prefix-map (kbd "m n") 'mc/mark-next-lines)
      (define-key prefix-map (kbd "m p") 'mc/mark-previous-lines)
      (define-key prefix-map (kbd "p f") 'projext-find)
      (define-key prefix-map (kbd "p n") 'project-persist-create)
      (define-key prefix-map (kbd "q a") 'quickrun-with-arg)
      (define-key prefix-map (kbd "q e") 'quickrun-region)
      (define-key prefix-map (kbd "q q") 'quickrun)
      (define-key prefix-map (kbd "q r") 'quickrun-replace-region)
      (define-key prefix-map (kbd "q s") 'quickrun-shell)
      (define-key prefix-map (kbd "r i") 'yari-helm)
      (define-key prefix-map (kbd "s") 'eshell)
      (define-key prefix-map (kbd "t t") 'phpunit-current-test)
      (define-key prefix-map (kbd "t c") 'phpunit-current-class)
      (define-key prefix-map (kbd "w") 'whitespace-mode)
      (define-key map kbd-keymap-prefix prefix-map))
    map)
  "Keymap for kbd mode.")

(define-globalized-minor-mode kbd-global-mode
  kbd-mode
  kbd-mode 1)

(define-minor-mode kbd-mode
  "Keybindings map."
  :lighter " kbd"
  :keymap kbd-mode-map
  :group 'kbd)

(provide 'kbd)

;;; kbd.el ends here
