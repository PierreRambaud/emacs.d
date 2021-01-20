;;; php-module.el --- Company module

;;; Commentary:

;; Company module

;;; Code:

(require 'company)
(require 'diminish)

(setq company-idle-delay 0.5)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(global-company-mode 1)
(diminish 'global-company-mode)

(provide 'company-module)

;;; company-module.el ends here
