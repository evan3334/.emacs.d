(defun org-get-agenda-file-buffers ()
  "Returns all open agenda file buffers."
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
With a prefix argument, revert all agenda buffers before doing so."
  (interactive "P")
  (if revert
      (progn
	(org-agenda-revert-all)
	(org-agenda-redo-all))
    (org-agenda-redo-all)))

(use-package org-agenda
  :commands (org-agenda)
  :bind (:map org-agenda-mode-map
  	      ("g" . org-agenda-redo-or-revert))
  :config
  (defun org-agenda-search-directory (dir)
    "Recursively searches the given directory and all subdirectories for 
org agenda files that match `org-agenda-file-regexp' and returns the
result as a list of file paths, represented as strings."
    (if (stringp dir)
	(if (and (file-exists-p dir) (file-directory-p dir))
	    (directory-files-recursively (file-truename dir) org-agenda-file-regexp)
	  (error "Argument %s does not refer to an existing directory" dir))
      (error "Invalid argument %s in org-agenda-search-directory, string required" dir)))
  
  (setq org-agenda-files
	(append
	 '("~/Sync/notes/")
	 (org-agenda-search-directory "~/Sync/school/current")))
  
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
  :hook (org-mode . auto-fill-mode))


(provide 'module-org)
