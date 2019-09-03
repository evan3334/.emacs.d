(add-hook 'c-mode-common-hook
		  '(lambda ()
			 (setq tab-width 4)))

(global-set-key "\C-c\C-n" 'flycheck-mode)

;; ---------------
;; LSP Java Configuration
;; ---------------
(use-package lsp-java :ensure t :after lsp)
(use-package gradle-mode :ensure t)
(setq lsp-java-import-gradle-enabled nil)
(add-hook 'java-mode-hook
		    '(lambda ()
		      (lsp)
		      (flycheck-mode)
		      (local-set-key "\C-c\C-g" 'gradle-run)
		      (local-set-key "\C-c\C-r" 'lsp-rename)
		      (local-set-key "\C-c\C-f" 'lsp-format-buffer)))
;;(add-hook 'java-mode-hook 'flycheck-mode)

;;(use-package dap-mode
;;  :ensure t :after lsp-mode
;;  :config
;;  (dap-mode t)
;;  (dap-ui-mode t))

;;(use-package dap-java :after (lsp-java))
;;(use-package lsp-java-treemacs :after (treemacs))


(provide 'module-lang-java)
