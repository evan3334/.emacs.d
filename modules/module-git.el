(use-package magit
  :commands (magit-status
	     magit-commit)
  :config
  (setq magit-commit-arguments '("-S")))

(provide 'module-git)
