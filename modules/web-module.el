;;; web-module.el --- Web module

;;; Commentary:

;; Web module

;;; Code:

(require 'web-mode)
(require 'flycheck)

(add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))


;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; configure style, script and block padding
(defun indent-web-mode-hook ()
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil)))
(add-hook 'web-mode-hook 'indent-web-mode-hook)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(define-key web-mode-map (kbd "C-'") 'company-web-html)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; let smartparens handle these
(setq web-mode-enable-auto-quoting nil
      web-mode-enable-auto-pairing t)

;; 1. Remove web-mode auto pairs whose end pair starts with a latter
;;    (truncated autopairs like <?p and hp ?>). Smartparens handles these
;;    better.
;; 2. Strips out extra closing pairs to prevent redundant characters
;;    inserted by smartparens.
(dolist (alist web-mode-engines-auto-pairs)
  (setcdr alist
          (cl-loop for pair in (cdr alist)
                   unless (string-match-p "^[a-z-]" (cdr pair))
                   collect (cons (car pair)
                                 (string-trim-right (cdr pair) "\\(?:>\\|]\\|}\\)+")))))
(setf (alist-get nil web-mode-engines-auto-pairs) nil)

(provide 'web-module)

;;; web-module.el ends here
