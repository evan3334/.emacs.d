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

;; ---------------
;; Keep generated settings in a separate file.
;; ---------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; ---------------
;; Install selected packages that aren't installed
;; ---------------
(defun ensure-packages-installed (packages)
  "Installs a list of packages if they aren't already installed."
  (when (not (eq packages nil))
    (let ((package (car packages)))
      (when (not (package-installed-p package))
	  (package-install package)))
    (ensure-packages-installed (cdr packages))))

(condition-case nil
  (ensure-packages-installed package-selected-packages)
  (error
   (package-refresh-contents)
   (ensure-packages-installed package-selected-packages)))

;; -----------------
;; Configure themes
;; -----------------
(require 'doom-themes)
(require 'doom-modeline)

(defun doom-themes-configuration ()
  "`doom-themes-configuration' is interactive by the modeline, it will
start the nice defaults for `doom-one' and establish `doom-modeline-mode'."
  (interactive)
  (load-theme 'doom-one t)
  (setq doom-themes-enable-bold t      ; If nil, bold is universally disabled
	doom-themes-enable-italic t)   ; If nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-modeline-mode))

(doom-themes-configuration) ; Execute `doom-themes-configuration'

;; ---------------
;; Generic configuration for all languages
;; ---------------
(require 'smartparens-config)
(smartparens-global-mode)
(add-hook 'prog-mode-hook
	  '(lambda ()
	     (company-mode)))

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
