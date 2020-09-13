(use-package emojify
  :commands (emojify-mode))

(use-package company
  :hook ((telega-chat-mode . company-mode)))

(use-package company-emoji
  :commands (company-emoji-init)
  :hook ((telega-chat-mode . company-emoji-init)))

(use-package telega
  :commands (telega)
  :config
  (use-package telega-mnz)
  (setq telega-root-fill-column 50)
  (setq telega-chat-fill-column 50)
  (setq telega-chat-use-markdown-version 1)
  :hook ((telega-root-mode . emojify-mode)
	 (telega-chat-mode . (lambda ()
			       (emojify-mode)
			       (smartparens-mode -1)))))

(use-package erc-status-sidebar
  :commands (erc-status-sidebar-open))

(use-package erc-track
  :custom
  (erc-track-exclude-types '("JOIN" "PART" "NICK" "333" "353"))
  :after (erc))

(use-package erc-image
  :config
  (add-to-list 'erc-modules 'image)
  (erc-update-modules)
  :after (erc))

(use-package erc
  :commands (erc erc-tls znc)
  :custom
  (erc-prompt-for-password nil)
  :config
  (defun znc ()
    (interactive)
    (erc-tls :server "znc.evan.pw"
	 :port 6667
	 :nick "estraw"
	 :full-name "Evan Straw")
    (erc-status-sidebar-open)))

(provide 'module-chat)
