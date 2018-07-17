;;; direx-module.el --- Direx module

;;; Commentary:

;; Direx module

;;; Code:

(require 'popwin)
(require 'direx)
(require 'direx-project)

(popwin-mode 1)
(push '("*quickrun*" :height 20) popwin:special-display-config)
(push '("*magit-log*" :height 20) popwin:special-display-config)
(push '(direx:direx-mode :position left :width 45 :dedicated t) popwin:special-display-config)

(provide 'direx-module)

;;; direx-module.el ends here
