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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ---------------
;; Keep generated settings in a separate file.
;; ---------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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
(require 'all-the-icons)
(require 'doom-modeline)


(defun doom-themes-configuration ()
  "`doom-themes-configuration' is interactive by the modeline, it will
start the nice defaults for `doom-one' and establish `doom-modeline-mode'."
  (interactive)
  (load-theme 'doom-molokai t)
  (setq doom-themes-enable-bold t      ; If nil, bold is universally disabled
	doom-themes-enable-italic t)   ; If nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-modeline-mode)
  (setq doom-modeline-buffer-file-name-style 'file-name))

(doom-themes-configuration) ; Execute `doom-themes-configuration'

;;(set-face-attribute 'default nil
;;		    :family "Source Code Pro"
;;		    :height 120
;;		    :width 'normal
;;		    :weight 'semi-bold)


;; ---------------
;; Generic configuration for all languages
;; ---------------
(require 'smartparens-config)
(use-package column-enforce-mode :ensure t)
(smartparens-global-mode)
(global-hl-line-mode)
(column-number-mode)

;; turn on warning at 95 columns
(setq column-enforce-column 95)

;; make company dialog show up sooner
(setq company-idle-delay 0.1)

(add-hook 'prog-mode-hook
	  '(lambda ()
	     (company-mode)
	     (linum-mode)
	     (rainbow-delimiters-mode)
	     (column-enforce-mode)
	     (gradle-mode)))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; ---------------
;; Smartparens config for CC-like modes
;; ---------------
(sp-with-modes '(java-mode c++-mode c-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/**" "*/" :post-handlers '(("| " "SPC")
     					     (" ||\n[i]" "RET"))))
;;  (sp-local-pair "/*" nil)
;;  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")

;;  (sp-local-pair "/**" "*/" :post-handlers '((" | " "SPC")
;;					     (" ||\n[i]" "RET"))))


(global-set-key "\C-c\C-n" 'flycheck-mode)

;; ---------------
;; PDF-Tools config
;; ---------------
(use-package pdf-tools :ensure t)
(pdf-tools-install)

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

(add-hook 'c-mode-common-hook
		  '(lambda ()
			 (setq tab-width 4)))

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
(use-package lsp-java-treemacs :after (treemacs))

;; ---------------
;; Cquery configuration (C/C++)
;; ---------------
;; (require 'cquery)
;; (setq cquery-executable "/usr/bin/cquery")
;; (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
;; (defun cquery//enable ()
;;   (condition-case nil
;;       (lsp)
;;     (user-error nil)))
;; (add-hook 'c-mode-hook #'cquery//enable)
;; (add-hook 'c++-mode-hook #'cquery//enable)
(use-package ccls
  :hook ((c-mode c++-mode objc-mode) .
	 (lambda () (require 'ccls) (lsp))))
(setq ccls-executable "/usr/local/bin/ccls")

;; ---------------
;; Scheme config
;; ---------------
(setq geiser-active-implementations '(guile))
(require 'geiser)
(add-hook 'scheme-mode-hook
	  '(lambda ()
	     (geiser-mode)))

(add-hook 'geiser-repl-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)))

;; ---------------
;; Configure pdf-tools
;; ---------------
(use-package pdf-tools :ensure t)
(add-hook 'pdf-view-mode-hook
	  '(lambda ()
	     (setq pdf-view-midnight-colors '("white" . "#1c1e1f"))
	     (pdf-view-midnight-minor-mode)
	     (linum-mode -1)))


(defun open-dotfile ()
  "Opens the init.el file quickly."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key "\C-c\C-d" 'open-dotfile)
