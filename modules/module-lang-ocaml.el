;; ----------
;; OCaml Configuration
;; ----------

(use-package tuareg
  :ensure t
  :commands (tuareg-mode)
  :mode (("\\.ml[ily]?$" . tuareg-mode)
	 ("\\.topml$" . tuareg-mode)))

(use-package merlin
  :ensure t
  :commands (merlin-mode)
  :config
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil)
  (use-package merlin-eldoc
    :ensure t)
  :hook (tuareg-mode . merlin-mode))

(use-package ocp-indent
  :commands (ocp-indent-buffer)
  :ensure t)

(use-package ocamlformat
  :commands (ocamlformat)
  :load-path "~/.opam/default/share/emacs/site-lisp"
  :custom (ocamlformat-enable 'enable-outside-detected-project))

(use-package utop
  :ensure t
  :commands (utop
	     utop-minor-mode)
  :after (company)
  :hook ((tuareg-mode . utop-minor-mode)
	 (utop-mode . company-mode)))

(use-package dune
  :ensure t
  :commands (dune-mode)
  :mode ("dune" . dune-mode))

(provide 'module-lang-ocaml)
