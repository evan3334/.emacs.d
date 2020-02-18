;; ---------------
;; Scheme config
;; ---------------


(defvar guix-checkout "~/Sync/code/guix"
  "The location of the local Guix checkout.")

(use-package geiser
  :commands (geiser
	     run-geiser)
  :init
  (put 'geiser-guile-load-path 'safe-local-variable #'listp)
  (setq geiser-active-implementations '(guile racket chicken))
  (with-eval-after-load 'geiser-guile
    (add-to-list 'geiser-guile-load-path guix-checkout))
  :hook ((scheme-mode . (lambda ()
			  (geiser-mode)
			  (rainbow-delimiters-mode)
			  (setup-prettify-symbols)))
	 (geiser-repl-mode . (lambda ()
			       (rainbow-delimiters-mode)
			       (setup-prettify-symbols)))))

(use-package yasnippet
  :commands (yas-minor-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat guix-checkout "/etc/snippets")))

(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook (((racket-mode
	   racket-repl-mode) . (lambda ()
				 (rainbow-delimiters-mode)
				 (company-mode)
				 (setup-prettify-symbols)))))

(defun setup-prettify-symbols ()
  (setq prettify-symbols-alist '(("lambda" . 955)
				 ("->" . 8594)))
  (prettify-symbols-mode))

(provide 'module-lang-scheme)
