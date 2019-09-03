;; ---------------
;; Generic LSP Configuration
;; ---------------
(use-package projectile :ensure t)
(use-package neotree :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)

;; ---------------
;; Generic configuration for all languages
;; ---------------

(require 'smartparens-config)
(use-package column-enforce-mode :ensure t)
(smartparens-global-mode)
(global-hl-line-mode)
(column-number-mode)

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
(sp-with-modes '(java-mode c++-mode c-mode go-mode groovy-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/**" "*/" :post-handlers '(("| " "SPC")
     					     (" ||\n[i]" "RET"))))
;;  (sp-local-pair "/*" nil)
;;  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")

;;  (sp-local-pair "/**" "*/" :post-handlers '((" | " "SPC")
;;					     (" ||\n[i]" "RET"))))


(provide 'module-lang-general)
