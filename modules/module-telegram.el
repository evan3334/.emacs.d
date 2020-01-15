(use-package emojify
  :commands (emojify-mode))

(use-package telega
  :commands (telega)
  :hook ((telega-root-mode . emojify-mode)
	 (telega-chat-mode . emojify-mode)))
(provide 'module-telegram)
