;;; js-module.el --- Js module

;;; Commentary:

;; Js module

;;; Code:

(require 'js-comint)

(setq js-indent-level 4)
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[JGK]" "" output)))))

(provide 'js-module)

;;; js-module.el ends here
