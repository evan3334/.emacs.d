;; ---------------
;; Scheme config
;; ---------------
(setq geiser-active-implementations '(guile racket chicken))

(defvar guix-checkout "~/Sync/code/guix"
  "The location of the local Guix checkout.")

(use-package geiser
  :ensure t
  :defer t
  :init (add-to-list 'geiser-guile-load-path guix-checkout)
  :hook ((scheme-mode . (lambda ()
			  (geiser-mode)
			  (rainbow-delimiters-mode)
			  (setup-prettify-symbols)))
	 (geiser-repl-mode . (lambda ()
			       (rainbow-delimiters-mode)
			       (setup-prettify-symbols)))))

(use-package yasnippet
  :ensure t
  :defer t
  :config (add-to-list 'yas-snippet-dirs (concat guix-checkout "/etc/snippets"))
  :hook ((scheme-mode . yas-minor-mode-on)
	 (geiser-repl-mode . yas-minor-mode-on)))

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
