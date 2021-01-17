;;; python-module.el --- python module

;;; Commentary:

;; Python module

;;; Code:

(require 'elpy)

(elpy-enable)
(setq elpy-rpc-backend "rope")
(add-hook 'python-mode-hook (lambda ()
                              (setq python-indent-offset 4)
                              (setq python-guess-indent nil)
                              (define-key python-mode-map (kbd "RET") 'newline-and-indent)))
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

(provide 'python-module)

;;; python-module.el ends here
