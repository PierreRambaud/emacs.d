;;; core.el --- Core engine

;;; Commentary:

;; Initiliaze everything

;;; Code:
(require 'package)
(require 'crux)

(require 'guru-mode)
(add-hook 'prog-mode-hook 'guru-mode)
(guru-mode +1)

;;Ignore emoji
(add-to-list 'face-ignored-fonts "Noto Color Emoji")

;;Global configuration
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))
(if (functionp 'menu-bar-mode) (menu-bar-mode -1))
(if (functionp 'scroll-bar-mode) (scroll-bar-mode -1))

;; (blink-cursor-mode -1)
(delete-selection-mode t)
(global-auto-revert-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 8)            ;; but maintain correct appearance

(setq confirm-kill-emacs 'yes-or-no-p
      require-final-newline t
      scroll-conservatively 10000
      scroll-step 1
      delete-trailing-lines t
      vc-follow-symlinks t
      inhibit-startup-screen t)

;; Setup Project-persist, projectile and projext
(require 'project-persist)
(setq project-persist-settings-dir (expand-file-name "project-persist" var-dir))
(setq project-persist-auto-save-global nil)

(require 'projectile)

;; diminish keeps the modeline tidy
(require 'diminish)
(diminish 'guru-mode)

(setq projectile-cache-file (expand-file-name "projectile.cache" var-dir))
(setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" var-dir))
(projectile-mode t)
(diminish 'projectile-mode "Prjl")
(add-to-list 'projectile-globally-ignored-directories ".project")
(setq projectile-globally-ignored-files '())

(require 'projext)
(projext-init)

;;; core.el ends here

;; Ispell
(setq ispell-program-name "ispell")

;; Print config
(setq ps-font-size 8
      ps-header-font-size 9
      ps-header-title-font-size 10
      ps-line-number t
      ps-line-number-font-size 8
      ps-line-number-step 1
      ps-print-color-p (quote black-white))

;; Auto mode
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" dir))

;;Small fix for selection with shift+up
;; More infos: http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00174.html
(if (tty-type)
    (progn
      (define-key input-decode-map "\e[1;2A" [S-up])
      (define-key input-decode-map "\e[1;2B" [S-down])
      (define-key input-decode-map "\e[1;2C" [S-right])
      (define-key input-decode-map "\e[1;2D" [S-left])
      (define-key input-decode-map "\e[1;5A" [C-up])
      (define-key input-decode-map "\e[1;5B" [C-down])
      (define-key input-decode-map "\e[1;5C" [C-right])
      (define-key input-decode-map "\e[1;5D" [C-left])
      (define-key input-decode-map "\e[1;3A" [M-up])
      (define-key input-decode-map "\e[1;3B" [M-down])
      (define-key input-decode-map "\e[1;3C" [M-right])
      (define-key input-decode-map "\e[1;3D" [M-left])))
(provide 'core)
