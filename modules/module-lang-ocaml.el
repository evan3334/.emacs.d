;; ----------
;; OCaml Configuration
;; ----------

(use-package tuareg
  :ensure t
  :mode (("\\.ml[ily]?$" . tuareg-mode)
	 ("\\.topml$" . tuareg-mode))
  :hook (tuareg-mode . tuareg-imenu-set-imenu))

(use-package merlin
  :ensure t
  :config
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil)
  :hook (tuareg-mode . merlin-mode))

(use-package merlin-eldoc
  :ensure t)

(use-package ocp-indent
  :ensure t)

(use-package utop
  :ensure t
  :defer t
  :after (company)
  :hook (tuareg-mode . utop-minor-mode)
  :hook (utop-mode . company-mode))

(use-package dune
  :ensure t
  :defer t)

(provide 'module-lang-ocaml)
