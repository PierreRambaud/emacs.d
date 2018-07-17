;;; prelude-module.el --- Prelude module

;;; Commentary:

;; Prelude module

;;; Code:

(require 'kbd-module)

(defvar prelude-dir (expand-file-name "prelude" dir)
  "Prelude root directory.")
(defvar prelude-core-dir (expand-file-name "core" prelude-dir)
  "Prelude core root directory.")
(defvar prelude-modules-dir (expand-file-name "modules" prelude-dir)
  "Prelude modules root directory.")

(defun load-prelude ()
  (when (file-exists-p prelude-core-dir)
    (defvar prelude-packages '()
      "Overwrite prelude-packages variable. I use Cask for my dependencies.")
    (load (expand-file-name "prelude-packages.el" prelude-core-dir))
    (load (expand-file-name "prelude-core.el" prelude-core-dir))
    (init-packages)
    (defun prelude-require-package (package)
      "Install PACKAGE unless already installed."
      (unless (package-installed-p package)
        (error (concat "Package " package " needed for prelude module."))))
    (defun prelude-require-packages (packages)
      (mapc #'prelude-require-package packages)))
  (when (file-exists-p prelude-modules-dir)
    (add-to-list 'load-path prelude-modules-dir)))

(setq prelude-flyspell nil)
(setq prelude-guru t)

(if (file-exists-p prelude-dir)
    (load-prelude)
  (message "Couldn't find prelude directory"))

(define-key kbd-mode-map (kbd "C-c d") 'prelude-duplicate-current-line-or-region)
(define-key kbd-mode-map (kbd "C-c b") 'crux-switch-to-previous-buffer)

(provide 'prelude-module)

;;; prelude-module.el ends here
