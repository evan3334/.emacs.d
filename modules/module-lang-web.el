(use-package web-beautify
  :ensure t
  :defer t)
(use-package impatient-mode
  :ensure t
  :defer t)
(use-package php-mode
  :ensure t
  :defer t)
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

(provide 'module-lang-web)
