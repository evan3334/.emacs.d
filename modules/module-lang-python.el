(use-package ein
  :ensure t)

(add-hook 'python-mode-hook
	  (lambda ()
	    (lsp)))

;;(setq python-shell-interpreter "/usr/bin/python3")

(use-package pyvenv
  :commands (pyvenv-activate
	     pyvenv-workon))

;;(add-hook 'ein:notebook-mode-hook
;;	  (lambda ()
;;	    (auto-fill-mode -1)
;;	    (local-set-key (kbd "C-c C-d") (ein:worksheet-delete-cell))))

(provide 'module-lang-python)
