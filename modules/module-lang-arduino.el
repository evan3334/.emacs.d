(use-package arduino-mode
  :defer t
  :hook (arduino-mode . flycheck-mode))

(provide 'module-lang-arduino)
