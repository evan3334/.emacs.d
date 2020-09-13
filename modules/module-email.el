(use-package gitpatch
  :commands (gitpatch-mail
	     gitpatch-mail-attach-patch))

(require 'gnus)
(setq gnus-select-method '(nnnil ""))
(setq gnus-secondary-select-methods '((nnml "")
				      (nnimap "imap.gmail.com")
				      (nntp "news.gwene.org")))

(setq user-full-name "Evan Straw"
      user-mail-address "evan.straw99@gmail.com")

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")

(setq gnus-mime-display-multipart-related-as-mixed t)
(setq gnus-auto-select-first nil)
(setq gnus-summary-display-arrow nil)

(setq gnus-buttonized-mime-types '("multipart/signed"))
(setq mm-verify-option 'always)

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-article-mode-hook 'emojify-mode)

(provide 'module-email)
