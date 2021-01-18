
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Commentary:

;; Projext provide an extension for projectile and project-persist utilities

;;; Code:

(when (version< emacs-version "24.4")
  (error "Configuration requires at least GNU Emacs 24.4, but you're running %s" emacs-version))

(defvar dir (file-name-directory load-file-name)
  "The root dir of Emacs.")
(defvar modules-dir (expand-file-name "modules" dir)
  "Modules root directory.")
(defvar libs-dir (expand-file-name "libs" dir)
  "Libraries root directory.")
(defvar core-dir (expand-file-name "core" dir)
  "Core library root directory.")
(defvar var-dir (expand-file-name "var" dir)
  "Var/ root directory.")
(defvar cask-dir (expand-file-name ".cask" dir)
  "Cask root directory.")
(defvar emacsd-elpa-dir (expand-file-name
                         (concat (number-to-string emacs-major-version) "."
                                 (number-to-string emacs-minor-version) "/elpa")
                         cask-dir))
(defvar backup-dir (expand-file-name "backup" var-dir)
  "This folder stores all the backup files.")
(unless (file-exists-p backup-dir)
  (make-directory backup-dir))

(defvar savefile-dir (expand-file-name "savefile" var-dir)
  "This folder stores all the automatically generated save/history-files.")
(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path libs-dir)
(let ((default-directory emacsd-elpa-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; Use core libraries
(require 'core)
(require 'editor)

;; Load modules
(load (expand-file-name "modules.el" dir))

;; Load private config if exists
(let ((user-config-file "~/.emacsrc"))
  (when (file-exists-p user-config-file)
    (load-file user-config-file)))

;; Load theme
(require 'distinguished-theme)
(load-theme 'distinguished t)
