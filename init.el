;; -*- lexical-binding: t; -*-

;; --------------
;; Disable all mouse-interactive interfaces early.
;; --------------
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; ----------------
;; Configure package sources
;; ----------------
(require 'package)
;; Add MELPA
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; -----------------
;; Configure themes
;; -----------------
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; If nil, bold is universally disabled
      doom-themes-enable-italic t) ; If nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have its own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; ---------------
;; Generic LSP Configuration
;; ---------------
(use-package projectile :ensure t)
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)

;; ---------------
;; LSP Java Configuration
;; ---------------
(use-package lsp-java :ensure t :after lsp)
(add-hook 'java-mode-hook
		    '(lambda () 
		      (lsp)
		      (flycheck-mode)))
;;(add-hook 'java-mode-hook 'flycheck-mode)

;;(use-package dap-mode
;;  :ensure t :after lsp-mode
;;  :config
;;  (dap-mode t)
;;  (dap-ui-mode t))

;;(use-package dap-java :after (lsp-java))
(use-package lsp-java-treemacs :after (treemacs))

;; ---------------
;; Autogenerated customization stuff
;; ---------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-commit-arguments (quote ("-S")))
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet projectile use-package treemacs lsp-java flycheck lsp-ui company-lsp company lsp-mode magit doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
