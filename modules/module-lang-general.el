;; ---------------
;; Enable commands disabled by default
;; ---------------
(put 'downcase-region 'disabled nil)

;; ---------------
;; Generic LSP Configuration
;; ---------------
(use-package projectile
  :defer t)

(use-package neotree
  :defer t)

(use-package lsp-mode
  :defer t)

(use-package hydra
  :defer t)

(use-package yasnippet
  :defer t
  :config
  (yas-global-mode))

(use-package company
  :defer t
  :config
  (setq company-idle-delay 0.1)
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)))

(use-package company-lsp
  :defer t
  :after (company))

(use-package company-quickhelp
  :defer t
  :after (company)
  :hook (prog-mode . company-quickhelp-mode))

(use-package lsp-ui
  :defer t
  :after (lsp-mode))

(use-package magit
  :defer t)

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (sp-with-modes '(java-mode c++-mode c-mode go-mode groovy-mode)
    (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
    (sp-local-pair "/**" "*/" :post-handlers '(("| " "SPC")
     					       (" ||\n[i]" "RET"))))
  (sp-with-modes '(css-mode js2-mode js-mode)
    (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
    (sp-local-pair "/**" "*/" :post-handlers '(("| " "SPC")
     					       (" ||\n[i]" "RET"))))
  (sp-with-modes '(tuareg-mode utop-mode)
    (sp-local-pair "(*" "*)" :post-handlers '(("| " "SPC")
					      (" ||\n[i]" "RET")))))

;; ---------------
;; Generic configuration for all languages
;; ---------------

(use-package column-enforce-mode
  :defer t
  :ensure t
  :config
  (setq column-enforce-column 95)
  :hook prog-mode)

(global-hl-line-mode)
(column-number-mode)

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package gradle-mode
  :defer t
  :ensure t
  :hook prog-mode)

(add-hook 'prog-mode-hook
	  '(lambda ()
	     (linum-mode)
	     (auto-fill-mode)
	     (setq fill-column 95)))

(provide 'module-lang-general)
