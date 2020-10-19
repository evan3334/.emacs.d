;; ---------------
;; LSP Java Configuration
;; ---------------
(use-package lsp-java :ensure t :after lsp-mode
  :commands (lsp-java-lens-mode)
  :config
  (setq lsp-java-server-install-dir
	(expand-file-name "eclipse.jdt.ls" user-emacs-directory))
  (setq lsp-java-import-gradle-enabled nil)
  (setq tab-width 4)
  (use-package lsp-treemacs)
  :bind (:map java-mode-map
	      ("C-c C-g" . gradle-run)
	      ("C-c C-r" . lsp-rename)
	      ("C-c RET" . lsp-execute-code-action)
	      ("C-c C-f" . lsp-format-buffer)))

(use-package lsp-mode
  :commands (lsp)
  :hook ((java-mode . lsp)
		 (java-mode . lsp-java-lens-mode)))

(use-package gradle-mode :ensure t
  :commands (gradle-run))

(use-package flycheck
  :commands (flycheck-mode)
  :hook (java-mode . flycheck-mode))

(use-package dap-mode :ensure t :after lsp-mode
  :commands (dap-mode)
  :hook (java-mode . dap-mode)
  :config (dap-auto-configure-mode))

(provide 'module-lang-java)
