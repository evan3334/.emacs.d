;; ---------------
;; Scheme config
;; ---------------
(setq geiser-active-implementations '(guile racket chicken))

(use-package geiser
  :ensure t
  :defer t
  :hook ((scheme-mode . (lambda ()
			  (geiser-mode)
			  (rainbow-delimiters-mode)
			  (setup-prettify-symbols)))
	 (geiser-repl-mode . (lambda ()
			       (rainbow-delimiters-mode)
			       (setup-prettify-symbols)))))

(use-package racket-mode
  :ensure t
  :defer t
  :mode "\\.rkt\\'"
  :hook (racket-mode . (lambda ()
			 (rainbow-delimiters-mode)
			 (company-mode)
			 (company-quickhelp-mode)
			 (setup-prettify-symbols))))

(defun setup-prettify-symbols ()
  (setq prettify-symbols-alist '(("lambda" . 955)
				 ("->" . 8594)))
  (prettify-symbols-mode))

(provide 'module-lang-scheme)
