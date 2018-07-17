;;; magit-module.el --- Magit module

;;; Commentary:

;; Magit module

;;; Code:

(require 'magit)
(require 'magit-gitflow)
(add-hook 'magit-flow-hook 'turn-on-magit-gitflow)

(provide 'magit-module)

;;; magit-module.el ends here
