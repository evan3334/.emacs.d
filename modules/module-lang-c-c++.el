(use-package clang-format
  :ensure t
  :defer t)

;; ---------------
;; CCLS configuration (C/C++)
;; ---------------

(use-package ccls
  :ensure t
  :defer t
  :after (clang-format)
  :hook ((c-mode c++-mode objc-mode) .
         (lambda ()
	   (require 'ccls)
	   (require 'yasnippet)
	   (require 'clang-format)
	   (local-set-key (kbd "C-c C-f") clang-format-buffer)
	   (lsp))))


(c-add-style
 "sasha"
 '("bsd"
   (c-basic-offset . 4)
   (c-offsets-alist . ((substatement-open . 0)
		       (innamespace . 0)))))

(provide 'module-lang-c-c++)
