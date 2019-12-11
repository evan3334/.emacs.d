(use-package csv-mode
  :ensure t
  :defer t)

(use-package ediff
  :ensure t
  :defer t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(provide 'module-misc)
