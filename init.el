(when (version< emacs-version "24.1")
  (error "Configuration requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

(defvar dir (file-name-directory load-file-name)
  "The root dir of Emacs.")
(defvar modules-dir (expand-file-name "modules" dir)
  "Modules root directory.")
(defvar core-dir (expand-file-name "core" dir)
  "Core library root directory.")
(defvar vendor-dir (expand-file-name "vendor" dir)
  "Vendor's code not packaged.")
(defvar var-dir (expand-file-name "var" dir)
  "Var/ root directory.")
(defvar cask-dir (expand-file-name ".cask" dir)
  "Cask root directory.")
(defvar emacsd-elpa-dir (expand-file-name
                         (concat (number-to-string emacs-major-version) "."
                                 (number-to-string emacs-minor-version) "/elpa")
                         cask-dir))
(defvar elpa-dir (expand-file-name (concat emacs-version "/elpa") cask-dir)
  "Elpa packages root directory.")
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
(add-to-list 'load-path vendor-dir)
(let ((default-directory elpa-dir))
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
