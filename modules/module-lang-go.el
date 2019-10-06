(use-package go-mode
  :ensure t
  :defer t
  :bind (("C-c C-r" . lsp-rename)
	 ("C-c C-p" . lsp-format-buffer))
  :hook (go-mode . (lambda ()
	     (setq tab-width 4)
	     (lsp)
	     (flycheck-mode))))

(provide 'module-lang-go)
