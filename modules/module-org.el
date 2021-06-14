(defun org-get-agenda-file-buffers ()
  "Return all open agenda file buffers."
  (mapcar (lambda (file)
	    (org-get-agenda-file-buffer file))
	  org-agenda-files))

(defun org-agenda-revert-all ()
  "Reverts all Org buffers used for the Org agenda, reloading them from disk."
  (interactive)
  (mapcar (lambda (buf)
	    (with-current-buffer buf
	      (revert-buffer t t)))
	  (org-get-agenda-file-buffers)))

(defun org-agenda-redo-or-revert (&optional revert)
  "Rebuild all agenda views in the current buffer.
With a prefix argument (REVERT), revert all agenda buffers before
doing so."
  (interactive "P")
  (if revert
      (progn
	(org-agenda-revert-all)
	(org-agenda-redo-all))
    (org-agenda-redo-all)))

(defun my/org-agenda-list-exclude-tags-advice (orig-fn &rest args)
  "Exclude selected tags from `org-agenda-list'.
Intended as :around advice for `org-agenda-list'."
  (let ((org-agenda-tag-filter-preset '("-noagenda")))
    (apply orig-fn args)))

(use-package org-agenda
  :commands (org-agenda)
  :bind (:map org-agenda-mode-map
  	      ("g" . org-agenda-redo-or-revert))
  :config
  (defun org-agenda-search-directory (dir)
    "Recursively searches the given DIR and all subdirectories
for org agenda files that match `org-agenda-file-regexp' and
returns the result as a list of file paths, represented as
strings."
    (if (stringp dir)
	(if (and (file-exists-p dir) (file-directory-p dir))
	    (directory-files-recursively (file-truename dir) org-agenda-file-regexp)
	  (error "Argument %s does not refer to an existing directory" dir))
      (error "Invalid argument %s in org-agenda-search-directory, string required" dir)))

  (advice-add #'org-agenda-list :around #'my/org-agenda-list-exclude-tags-advice)
  (defun org-agenda-refresh-files-list ()
    (interactive)
    (setq org-agenda-files
	  (append
	   (org-agenda-search-directory "~/Sync/notes/")
	   (org-agenda-search-directory "~/Sync/school/current")))
    (setq recentf-exclude (org-agenda-files)))
  (org-agenda-refresh-files-list)
  
  (setq org-agenda-start-on-weekday 0
	org-deadline-warning-days 6
	org-columns-default-format "%ITEM %TODO %3PRIORITY %CLOCKSUM(Time) %Effort %TAGS"))

(use-package org
  :config
  (add-to-list 'org-export-backends 'md)
  (require 'org-habit)
  (setq org-habit-graph-column 55)
  (setq org-habit-show-habits-only-for-today nil)
  (let ((scale 1.5))
    (setq org-format-latex-options
	  (plist-put (plist-put org-format-latex-options :html-scale scale) :scale scale)))
  (setq org-tag-persistent-alist
	'((:startgroup . nil)
	  ("class" . ?c)
	  ("homework" . ?h)
	  ("project" . ?p)
	  ("event" . ?e)
	  (:endgroup . nil)))
  ;; Allow multiple line Org emphasis markup.
  ;; http://emacs.stackexchange.com/a/13828/115
  (setcar (nthcdr 4 org-emphasis-regexp-components) 20) ;Up to 20 lines, default is just 1
  ;; Below is needed to apply the modified `org-emphasis-regexp-components'
  ;; settings from above.
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
  :hook (org-mode . auto-fill-mode))


(provide 'module-org)
