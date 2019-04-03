;; ---------------
;; Scheme config
;; ---------------
(setq geiser-active-implementations '(guile racket))
(require 'geiser)
(add-hook 'scheme-mode-hook
	  '(lambda ()
	     (geiser-mode)))

(add-hook 'geiser-repl-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)))

(add-hook 'racket-repl-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)	  
	     (company-mode)
	     (company-quickhelp-mode)))
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(provide 'module-lang-scheme)
