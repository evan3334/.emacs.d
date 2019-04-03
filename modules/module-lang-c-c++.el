;; ---------------
;; Cquery configuration (C/C++)
;; ---------------
;; (require 'cquery)
;; (setq cquery-executable "/usr/bin/cquery")
;; (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
;; (defun cquery//enable ()
;;   (condition-case nil
;;       (lsp)
;;     (user-error nil)))
;; (add-hook 'c-mode-hook #'cquery//enable)
;; (add-hook 'c++-mode-hook #'cquery//enable)
(use-package ccls
  :hook ((c-mode c++-mode objc-mode) .
	 (lambda () (require 'ccls) (lsp))))
(setq ccls-executable "/usr/local/bin/ccls")

(provide 'module-lang-c-c++)
