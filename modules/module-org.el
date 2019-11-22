(use-package org
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
  
  (setq org-agenda-start-on-weekday 6)
  (setq org-deadline-warning-days 6))

(provide 'module-org)
