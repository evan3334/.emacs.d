;; ---------------
;; PDF-Tools config
;; ---------------
(use-package pdf-tools
  :ensure t
  :defer t
  :init
  (setq pdf-info-epdfinfo-program "~/bin/epdfinfo")
  :config
  (pdf-tools-install :no-query)
  :magic ("%PDF" . pdf-view-mode)
  :hook
  (pdf-view-mode . (lambda ()
		     (setq pdf-view-midnight-colors '("white" . "#1c1e1f"))
		     (pdf-view-midnight-minor-mode)
		     (linum-mode -1))))

(provide 'module-pdf)
