(require 'js-comint)

(add-hook 'js-mode-hook 'flymake-jslint-load)
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[JGK]" "" output)))))

(provide 'js-module)
