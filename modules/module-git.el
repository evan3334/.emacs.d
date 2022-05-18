(use-package magit
  :commands (magit-status
	     magit-commit)
  :init
  (put 'magit-log-mode 'magit-log-default-arguments
     '("--graph" "-n256" "--decorate --show-signature"))
  :bind
  ("C-x g" . magit-status)
  :config
  (setq magit-commit-arguments '("-S")
	transient-default-level 6))

(use-package magit-todos
  :commands (magit-todos-mode)
  :hook (magit-status-mode . magit-todos-mode)
  :after (magit))

(provide 'module-git)
