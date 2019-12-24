(use-package csv-mode
  :defer t)

(use-package ediff
  :defer t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(provide 'module-misc)
