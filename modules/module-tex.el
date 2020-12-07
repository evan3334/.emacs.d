(use-package latex
  :commands (TeX-latex-mode
	     latex-math-mode)
  :config
  (setq TeX-auto-save t
	TeX-parse-self t
	preview-pdf-color-adjust-method nil
	preview-image-type 'dvipng
	TeX-source-correlate-start-server t)
  (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Tools"))
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :hook ((LaTeX-mode . (lambda ()
			 (latex-math-mode)
			 (auto-fill-mode)
			 (setq fill-column 90)
			 (yas-minor-mode)
			 (lsp))))
  :bind (:map LaTeX-math-mode-map
	      ("` =" . LaTeX-math-equiv)
	      ("` !" . LaTeX-math-neg)
	      ("` v 0" . LaTeX-math-varnothing)))

;;*  (use-package company-auctex
;;*    :commands (company-auctex-init)
;;*    :hook (latex-mode . (lambda ()
;;*  			(company-mode)
;;*  			(company-auctex-init))))

(provide 'module-tex)
