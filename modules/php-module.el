(add-hook 'php-mode-hook (lambda ()
                           (subword-mode)
                           (flymake-php-load)
                           (turn-on-eldoc-mode)
                           (c-set-offset 'case-label '+)
                           (define-key php-mode-map (kbd "RET") 'newline-and-indent)))

(provide 'php-module)
