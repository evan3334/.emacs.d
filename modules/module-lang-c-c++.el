(defun c-style-setup ()
  "Set up custom C styles."
  (c-add-style
   "sasha"
   '("bsd"
     (c-basic-offset . 4)
     (c-offsets-alist . ((substatement-open . 0)
			 (innamespace . 0)
			 (inclass . +)
			 (access-label . --))))))

(use-package clang-format
  :commands (clang-format-buffer
	     clang-format-region))

;; ---------------
;; CCLS configuration (C/C++)
;; ---------------

(use-package ccls
  :init
  ;; set up c styles
  (c-style-setup)
  ;; make it safe to set ccls-args in .dir-locals.el files
  (put 'ccls-args 'safe-local-variable #'listp)
  :config (setq ccls-executable "/usr/local/bin/ccls")
  :bind (:map c-mode-map
	 ("C-c C-f" . clang-format-buffer)
	 :map c++-mode-map
	 ("C-c C-f" . clang-format-buffer))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda ()
	   (require 'ccls)
	   (lsp))))

(provide 'module-lang-c-c++)
