;;; prelude-module.el --- Based on Prelude configuration

;;; Commentary:

;; Prelude module

;;; Code:

(require 'kbd-module)

(guru-mode +1)
(diminish 'guru-mode)
(smartparens-mode +1)
(set (make-local-variable 'comment-auto-fill-only-comments) t)

(define-key kbd-mode-map (kbd "C-c d") 'prelude-duplicate-current-line-or-region)
(define-key kbd-mode-map (kbd "C-c b") 'crux-switch-to-previous-buffer)

(add-hook 'before-save-hook 'prelude-cleanup-maybe nil t)
(whitespace-mode +1)

(add-hook 'text-mode-hook 'prelude-enable-flyspell)
(add-hook 'text-mode-hook 'prelude-enable-whitespace)

(provide 'prelude-module)

;;; prelude-module.el ends here
