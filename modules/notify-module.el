(require 'notifications)

(defvar notify-icon-theme-path (expand-file-name ".icons/ACYL_Icon_Theme_0.9.4/" (getenv "HOME"))
  "Icons theme path.")
(defvar notify-icon "scalable/apps/emacs.svg"
  "Application icon path. Relative to icon theme path.")
(setq notifications-application-icon (expand-file-name notify-icon notify-icon-theme-path)
      notifications-on-action-map t
      notifications-on-action-object t
      notifications-on-close-map t
      notifications-on-close-object t)

(provide 'notify-module)
