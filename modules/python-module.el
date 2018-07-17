;;; python-module.el --- python module

;;; Commentary:

;; Python module

;;; Code:

(require 'elpy)

(elpy-enable)
(setq elpy-rpc-backend "rope")
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map (kbd "RET") 'newline-and-indent)))
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(require 'editorconfig)
(editorconfig-mode 1)

(provide 'python-module)

;;; python-module.el ends here
