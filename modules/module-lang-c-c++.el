;; ---------------
;; CCLS configuration (C/C++)
;; ---------------

(use-package ccls
  :ensure t
  :defer t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda ()
	   (require 'ccls)
	   (require 'yasnippet)
	   (lsp))))

(c-add-style
 "sasha"
 '("bsd"
   (c-basic-offset . 4)
   (c-offsets-alist . ((substatement-open . 0)))))

(provide 'module-lang-c-c++)
