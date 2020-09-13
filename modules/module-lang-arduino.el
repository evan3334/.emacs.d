(use-package arduino-mode
  :defer t
  :hook (arduino-mode . (lambda ()
			  (flycheck-mode)
			  (rainbow-delimiters-mode))))

(provide 'module-lang-arduino)
