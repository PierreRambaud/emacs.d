;;; kbd-module.el --- Kbd module

;;; Commentary:

;; Kbd module

;;; Code:

(require 'kbd)

(kbd-global-mode)
(defun set-cmd-to-kbd (command keybinding)
  "Bind COMMAND to a KEYBINDING quickly."
  (interactive "sCommand: \nsKeybinding: ")
  (setq cmd command)
  (define-key kbd-mode-map (kbd keybinding) `(lambda ()
                                               (interactive)
                                               (let ((default-directory ,default-directory))
                                                 (compile ,cmd)))))
(define-key kbd-mode-map (kbd "M-<up>") 'windmove-up)
(define-key kbd-mode-map (kbd "M-<down>") 'windmove-down)
(define-key kbd-mode-map (kbd "M-<left>") 'windmove-left)
(define-key kbd-mode-map (kbd "M-<right>") 'windmove-right)
(define-key kbd-mode-map (kbd "C-+") 'text-scale-increase)
(define-key kbd-mode-map (kbd "C--") 'text-scale-decrease)
(define-key kbd-mode-map (kbd "C-q f") 'forward-list)
(define-key kbd-mode-map (kbd "C-q b") 'backward-list)
(define-key kbd-mode-map (kbd "C-c b") 'crux-switch-to-previous-buffer)
(define-key kbd-mode-map (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(define-key kbd-mode-map (kbd "C-c b") 'crux-switch-to-previous-buffer)

(provide 'kbd-module)

;;; kbd-module.el ends here
