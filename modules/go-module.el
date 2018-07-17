;;; go-module.el --- Golang module

;;; Commentary:

;; Golang module

;;; Code:

(add-hook 'go-mode-hook (lambda ()
                          (subword-mode)
                          (flymake-go-load)
                          (turn-on-eldoc-mode)
                          (c-set-offset 'case-label '+)
                          (define-key go-mode-map (kbd "RET") 'newline-and-indent)))

(provide 'go-module)

;;; go-module.el ends here
