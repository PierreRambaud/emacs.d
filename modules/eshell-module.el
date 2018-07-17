;;; eshell-module.el --- Eshell module

;;; Commentary:

;; Eshell module

;;; Code:

(defun eshell/clear ()
  "Clear eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/magit ()
  "Open magit in current repository."
  (interactive)
  (magit-status (eshell/pwd)))

(defun git-current-branch (pwd)
  "Return current git branch as a string in current directory `PWD`."
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat " ["
                          (if (> (length git-output) 0)
                              (concat (substring git-output 0 -1) (git-changes pwd))
                            "(no branch)")
                          "]") 'face `(:foreground "dim gray")))))

(defun git-unpushed-commits (pwd)
  "Return number of unpushed commits in repository `PWD`."
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git log @{u}.. --oneline 2>/dev/null | wc -l"))))
      (let ((out (substring git-output 0 -1)))
        (when (not (string= out "0"))
          (propertize (concat " [" out "]")
                      'face `(:foreground "red")))))))

(defun git-changes (pwd)
  "Get modified files in repository `PWD`."
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string
                       (concat "cd " pwd " && git status --short | wc -l"))))
      (let ((out (substring git-output 0 -1)))
        (when (not (string= out "0")) " ⚡")))))

(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t))

(setq eshell-highlight-prompt nil)
(setq eshell-history-size 512)
(setq eshell-directory-name (concat (getenv "HOME") "/.eshell"))
(setq eshell-prompt-regexp "^[^#$]*[#$] ")
(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda ()
                        (replace-regexp-in-string
                         (concat "/home/" (getenv "USER")) "~"
                         (eshell/pwd)))) 'face `(:foreground "DodgerBlue2"))
         (or (git-current-branch (eshell/pwd)))
         (or (git-unpushed-commits (eshell/pwd)))
         (propertize " > " 'face `(:foreground "DodgerBlue2")))))

(provide 'eshell-module)

;;; eshell-module.el ends here
