(require 'powerline)

(add-hook 'desktop-after-read-hook 'powerline-reset)
(defadvice desktop-kill(before clear-power-line-cache () activate)
  (set-frame-parameter nil 'powerline-cache nil))
(powerline-default-theme)

(provide 'powerline-module)
