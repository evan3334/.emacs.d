(use-package slime
  :config
  (add-to-list 'slime-contribs 'slime-repl)
  (setq inferior-lisp-program "sbcl")
  :commands (slime slime-connect))

(provide 'module-lang-cl)
