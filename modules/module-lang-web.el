;;(defvar tidy-path
;;  (expand-file-name "tidy.el" thirdparty-dir))

;;(use-package tidy
;;  :load-path tidy-path
;;  :commands (tidy-buffer
;;  	     tidy-parse-config-file
;;	     tidy-save-settings
;;	     tidy-build-menu))

;; (autoload 'tidy-buffer tidy-path "Run Tidy HTML parser on current buffer" t)
;; (autoload 'tidy-parse-config-file tidy-path "Parse the `tidy-config-file'" t)
;; (autoload 'tidy-save-settings tidy-path "Save settings to `tidy-config-file'" t)
;; (autoload 'tidy-build-menu tidy-path "Install an options menu for HTML Tidy." t)

;; (setq tidy-config-dir "")
;; (setq tidy-temp-dir "")
;;(setq tidy-shell-command "/usr/bin/tidy")
;;(setq tidy-menu-lock t)
;; (setq tidy-menu-x-position 211)

(use-package web-beautify
  :ensure t)
(use-package impatient-mode
  :ensure t)
(use-package php-mode
  :ensure t)
;;(use-package flymd
;;  :ensure t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

(eval-after-load 'js2-mode (lambda ()
  (define-key js2-mode-map (kbd "C-c b") 'web-beautify-js)
  (define-key js2-mode-map (kbd "C-c C-r") 'lsp-rename)))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode (lambda ()
  (define-key html-mode-map (kbd "C-c b") 'web-beautify-html)
  (define-key html-mode-map (kbd "C-c C-f") 'sp-html-next-tag)
  (define-key html-mode-map (kbd "C-c C-b") 'sp-html-previous-tag)))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(add-hook 'html-mode-hook
	  (lambda ()
	    (lsp)
	    (httpd-start)
	    (impatient-mode)))

(add-hook 'css-mode-hook
	  (lambda ()
	    (lsp)))

(add-hook 'js2-mode-hook
	  (lambda ()
	    (lsp)))

(add-hook 'php-mode-hook
	  (lambda ()
	    (c-set-style "wordpress")))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(sp-with-modes '(css-mode js2-mode js-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/**" "*/" :post-handlers '(("| " "SPC")
     					     (" ||\n[i]" "RET"))))

(provide 'module-lang-web)
