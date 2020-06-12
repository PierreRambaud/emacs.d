
(defun insert-to-prev-line-and-indent (text)
  "Insert TEXT to the previous line with indentation."
  (beginning-of-line)
  (open-line 1)
  (insert text)
  (indent-according-to-mode))

(defun insert-to-next-line-and-indent (text)
  "Insert TEXT to the next line with indentation."
  (end-of-line)
  (newline-and-indent)
  (insert text)
  (indent-according-to-mode))

(defun php-doc-block-var-or-attr (tag-type type name value is-nullable)
  "Insert doc block for a property or an attribute"
  (cond
   ((and value (= (string-width type) 0))
    (cond
     ((string-match "^=\s*\\(array(.*)\\|\\[\.*\]\\)" value) (setq type "array"))
     ((string-match "^=\s*\[0-9\]*\\.\[0-9\]+$" value)  (setq type "float"))
     ((string-match "^=\s*\[0-9\]+$" value) (setq type "int"))
     ((string-match "^=\s*\['\"]" value) (setq type "string"))
     ((string-match "^=\s*\\(true\\|false\\)" value) (setq type "bool"))))

   ((and (= (string-width type) 0) (not value))
    (setq type "mixed")))

  (when (equal is-nullable "?")
    (setq type (concat type "|null")))

  (insert-to-next-line-and-indent (concat "* @" tag-type " " type  " " name)))

(defun php-doc-block-function (name arguments return-type is-return-nullable)
  "Insert php docblock for function"
  (insert-to-next-line-and-indent (concat "* " name))

  (when (> (string-width arguments) 0)
    (insert-to-next-line-and-indent "*")
    (dolist (arg (split-string arguments "\s*,\s*"))
      (string-match "\s*\\(\[\?\]?\\)\s*\\(\[\\\]?\[a-zA-Z0-9_\]*\\)?\s*\\($\[a-zA-Z0-9_\]+\\)\s*\\(=.*\\)?" arg)
      (php-doc-block-var-or-attr "param" (match-string 2 arg) (match-string 3 arg) (match-string 4 arg) (match-string 1 arg))))

  (when (> (string-width return-type) 0)
    (insert-to-next-line-and-indent "*")
    (when (equal is-return-nullable "?")
      (setq return-type (concat return-type "|null")))
    (insert-to-next-line-and-indent (concat "* @return " return-type))))

(defun php-doc-block-class (type name)
  "Insert php doc block for class, interface etc."

  (insert-to-next-line-and-indent (concat "* " name " " type)))

(defun php-doc-block ()
  "Insert php docblock."
  (interactive)
  (let ((line (thing-at-point 'line)))
    (insert-to-prev-line-and-indent "/**")
    (cond
     ((string-match "function\s*" line)
      (beginning-of-line)
      (let ((line (thing-at-point 'line)) (func-defun "") (s-point (point)) (e-point (re-search-forward ";\\|{" nil '(nil))))
        (goto-char s-point)
        (if e-point
            (setq func-defun (replace-regexp-in-string "{\\|\n" "" (buffer-substring s-point e-point)))
          (progn
            (end-of-line)
            (setq func-defun (buffer-substring s-point (point))))
          )
        (when (string-match "function\s+\\([A-Za-z0-9_]+\\)\s*(\\(.*\\))\s*:*\s*\\(\[\?\]?\\)\s*\\(\[A-Za-z0-9_\\\]*\\)" func-defun)
          (php-doc-block-function (match-string 1 func-defun) (match-string 2 func-defun) (match-string 4 func-defun) (match-string 3 func-defun)))))
     ((string-match "\s*\\([a-zA-Z0-9_]+\\)?\s*\\($\[a-zA-Z0-9_\]+\\)\s*\\(=\[^;\]*\\)?" line)
      (php-doc-block-var-or-attr "var" "" (match-string 2 line) (match-string 3 line) ""))
     ((string-match "\\(class\\|interface\\|trait\\|abstract class\\)\s+\\(\[a-zA-Z0-9_\]+\\)" line)
      (php-doc-block-class (match-string 1 line) (match-string 2 line))))
    (insert-to-next-line-and-indent "*/")))

(provide 'php-doc-block)
