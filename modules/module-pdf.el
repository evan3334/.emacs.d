;; ---------------
;; PDF-Tools config
;; ---------------
(use-package pdf-tools :ensure t)
(setq pdf-info-epdfinfo-program "~/bin/epdfinfo")
(pdf-tools-install)

;; ---------------
;; Configure pdf-tools
;; ---------------
(use-package pdf-tools :ensure t)
(add-hook 'pdf-view-mode-hook
	  '(lambda ()
	     (setq pdf-view-midnight-colors '("white" . "#1c1e1f"))
	     (pdf-view-midnight-minor-mode)
	     (linum-mode -1)))

(provide 'module-pdf)
