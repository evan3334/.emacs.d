(setq telega-dir
      (expand-file-name "telega.el" thirdparty-dir))

(use-package telega
  ;;  :load-path telega-dir
  :ensure t
  :commands (telega)
  :hook ((telega-root-mode . emojify-mode)
	 (telega-chat-mode . emojify-mode))
  :defer t)
(provide 'module-telegram)
