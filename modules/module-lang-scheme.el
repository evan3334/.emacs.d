;; ---------------
;; Scheme config
;; ---------------
(setq geiser-active-implementations '(guile racket chicken))
(require 'geiser)

(defun setup-prettify-symbols ()
  (setq prettify-symbols-alist '(("lambda" . 955)
				 ("->" . 8594)))
  (prettify-symbols-mode))

(add-hook 'scheme-mode-hook
	  '(lambda ()
	     (geiser-mode)
	     (setup-prettify-symbols)))

(add-hook 'geiser-repl-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)
	     (setup-prettify-symbols)))

(add-hook 'racket-repl-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)	  
	     (company-mode)
	     (company-quickhelp-mode)
	     (setup-prettify-symbols)))
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(provide 'module-lang-scheme)
