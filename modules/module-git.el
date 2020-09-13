(use-package magit
  :commands (magit-status
	     magit-commit)
  :bind
  ("C-x g" . magit-status)
  :config
  (setq magit-commit-arguments '("-S")))

(provide 'module-git)
