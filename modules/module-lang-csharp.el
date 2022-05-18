(use-package csharp-mode
  :mode ("\\.cs\\'" . csharp-mode)
  :hook (csharp-mode . lsp))

(provide 'module-lang-csharp)
