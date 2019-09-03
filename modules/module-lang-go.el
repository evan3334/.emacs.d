(use-package go-mode
  :ensure t)

(add-hook 'go-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (lsp)
	     (flycheck-mode)
	     (local-set-key "\C-c\C-r" 'lsp-rename)
	     (local-set-key "\C-c\C-p" 'lsp-format-buffer)))

(provide 'module-lang-go)
