(use-package arduino-mode
  :ensure t)

(add-hook 'arduino-mode-hook
	  (lambda ()
	    (flycheck-mode)))

(provide 'module-lang-arduino)
