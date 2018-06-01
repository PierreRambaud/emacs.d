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
(define-key kbd-mode-map (kbd "M-x") 'helm-M-x)
(define-key kbd-mode-map (kbd "M-<up>") 'windmove-up)
(define-key kbd-mode-map (kbd "M-<down>") 'windmove-down)
(define-key kbd-mode-map (kbd "M-<left>") 'windmove-left)
(define-key kbd-mode-map (kbd "M-<right>") 'windmove-right)
(define-key kbd-mode-map (kbd "C-x C-b") 'ibuffer)
(define-key kbd-mode-map (kbd "C-+") 'text-scale-increase)
(define-key kbd-mode-map (kbd "C--") 'text-scale-decrease)
(define-key kbd-mode-map (kbd "C-M f") 'forward-list)
(define-key kbd-mode-map (kbd "C-M b") 'backward-list)

(provide 'kbd-module)
