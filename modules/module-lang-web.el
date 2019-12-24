(use-package web-beautify
  :commands (web-beautify-html
	     web-beautify-css
	     web-beautify-js))

(use-package php-mode
  :hook (php-mode . (lambda () (c-set-style "wordpress"))))

(use-package js2-mode
  :mode "\\.js\\'"
  :bind (("C-c b" . web-beautify-js)
	 ("C-c C-r" . lsp-rename))
  :hook (js2-mode . lsp))

(use-package json-mode
  :bind ("C-c b" . web-beautify-js))

(use-package sgml-mode
  :bind (("C-c b" . web-beautify-html)
	 ("C-c C-f" . sp-html-next-tag)
	 ("C-c C-b" . sp-html-previous-tag))
  :hook (html-mode . lsp))

(use-package css-mode
  :bind ("C-c b" . web-beautify-css)
  :hook (css-mode . lsp))

(use-package sql
  :hook (sql-interactive-mode . (lambda () (toggle-truncate-lines t))))

(provide 'module-lang-web)
