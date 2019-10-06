;; ---------------
;; Generic LSP Configuration
;; ---------------
(use-package projectile
  :ensure t
  :defer t)
(use-package neotree
  :ensure t
  :defer t)
(use-package lsp-mode
  :ensure t
  :defer t)
(use-package hydra
  :ensure t
  :defer t)
(use-package yasnippet
  :ensure t
  :defer t)
(use-package company
  :ensure
  :defer t)
(use-package company-lsp
  :ensure t
  :defer t
  :after (company))
(use-package company-quickhelp
  :ensure t
  :defer t
  :after (company))
(use-package lsp-ui
  :ensure t
  :defer t)
(use-package magit
  :ensure t
  :defer t)
(use-package smartparens
  :ensure t
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

(use-package column-enforce-mode :ensure t)
(global-hl-line-mode)
(column-number-mode)

(use-package rainbow-delimiters
  :ensure t
  :defer t)

;; turn on warning at 95 columns
(defconst column-limit 95)

;; make company dialog show up sooner
(setq company-idle-delay 0.1)

(add-hook 'prog-mode-hook
	  '(lambda ()
	     (company-mode)
	     (company-quickhelp-mode)
	     (linum-mode)
	     (rainbow-delimiters-mode)
	     (column-enforce-mode)
	     (setq column-enforce-column column-limit)
	     (auto-fill-mode)
	     (setq fill-column column-limit)
	     (gradle-mode)))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; ---------------
;; Smartparens config for CC-like modes
;; ---------------

;;  (sp-local-pair "/*" nil)
;;  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")

;;  (sp-local-pair "/**" "*/" :post-handlers '((" | " "SPC")
;;					     (" ||\n[i]" "RET"))))


(provide 'module-lang-general)
