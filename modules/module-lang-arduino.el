(use-package arduino-mode
  :ensure t
  :defer t
  :hook (arduino-mode . flycheck-mode))

(provide 'module-lang-arduino)
