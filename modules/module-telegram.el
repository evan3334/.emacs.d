(setq telega-dir
      (expand-file-name "telega.el" thirdparty-dir))

(use-package telega
  :load-path telega-dir
  :commands (telega)
  :defer t)

(global-emojify-mode)

(provide 'module-telegram)
