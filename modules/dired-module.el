;;; direx-module.el --- Direx module

;;; Commentary:

;; Direx module

;;; Code:

(require 'popwin)
(require 'dired)

(popwin-mode 1)
(push '("*quickrun*" :height 20) popwin:special-display-config)
(push '("*magit-log*" :height 20) popwin:special-display-config)

(provide 'dired-module)

;;; direx-module.el ends here
