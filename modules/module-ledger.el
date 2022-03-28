(use-package ledger-mode
  ;;:custom (ledger-binary-path "hledger")
  :custom (ledger-clear-whole-transactions t)
  :mode "\\.journal\\'"
  :hook '((ledger-mode . company-mode)
	  (ledger-mode . emojify-mode)))


(provide 'module-ledger)
