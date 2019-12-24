(use-package clang-format
  :defer t
  :bind ("C-c C-f" . clang-format-buffer))

;; ---------------
;; CCLS configuration (C/C++)
;; ---------------

(use-package ccls
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
   (c-offsets-alist . ((substatement-open . 0)
		       (innamespace . 0)))))

(provide 'module-lang-c-c++)
