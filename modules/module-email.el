(use-package gitpatch
  :commands (gitpatch-mail
	     gitpatch-mail-attach-patch))

(use-package gnus
  :commands (gnus)
  :config
  (setq gnus-select-method '(nnnil ""))
  (setq gnus-secondary-select-methods '((nnml "")
					(nnimap "imap.gmail.com")))
  
  (setq user-full-name "Evan Straw"
	user-mail-address "evan.straw99@gmail.com")
  
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-default-smtp-server "smtp.gmail.com")
  
  (setq gnus-mime-display-multipart-related-as-mixed t)
  (setq gnus-auto-select-first nil)
  (setq gnus-summary-display-arrow nil)
  (setq gnus-buttonized-mime-types '("multipart/signed"))
  :hook ((gnus-group-mode . gnus-topic-mode)
	 (gnus-article-mode . emojify-mode)))

(provide 'module-email)
