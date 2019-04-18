(add-hook 'python-mode-hook
	  (lambda ()
	    (lsp)))

(setq python-shell-interpreter "/usr/bin/python3")

(provide 'module-lang-python)
