(use-package slime
  :ensure t
  :config
  (add-to-list 'slime-contribs 'slime-repl)
  :defer t)

(provide 'module-lang-cl)
