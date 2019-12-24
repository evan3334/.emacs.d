(use-package gitpatch
  :defer t)

(require 'gnus)

(setq gnus-select-method '(nnnil ""))

(setq gnus-secondary-select-methods '((nnml "")
				      (nnimap "imap.gmail.com")))

(setq user-full-name "Evan Straw"
      user-mail-address "evan.straw99@gmail.com")

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-mime-display-multipart-related-as-mixed t)

(setq gnus-auto-select-first nil)

(setq gnus-summary-display-arrow nil)

(provide 'module-email)
