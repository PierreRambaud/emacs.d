;;; popwin-module.el --- Popwin module

;;; Commentary:

;; Popwin module

;;; Code:

(require 'popwin)

(popwin-mode 1)
(push '("*quickrun*" :height 20) popwin:special-display-config)
(push '("*magit-log*" :height 20) popwin:special-display-config)

(provide 'popwin-module)

;;; popwin-module.el ends here
