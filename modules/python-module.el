(require 'elpy)

(elpy-enable)
(setq elpy-rpc-backend "rope")
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map (kbd "RET") 'newline-and-indent)))
(provide 'python-module)
