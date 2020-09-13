;; ---------------
;; PDF-Tools config
;; ---------------
(use-package pdf-tools
  :init
;;  (setq pdf-info-epdfinfo-program "~/bin/epdfinfo")
  (defun revert-buffer-noconfirm ()
    (interactive)
    (revert-buffer t t))
  :config
  (pdf-tools-install :no-query)
  :magic ("%PDF" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
	 ("r" . revert-buffer-noconfirm)
	 ("g" . revert-buffer-noconfirm))
  :hook
  (pdf-view-mode . (lambda ()
		     (setq pdf-view-midnight-colors '("white" . "#1c1e1f"))
		     (pdf-view-midnight-minor-mode)
		     (linum-mode -1))))

(provide 'module-pdf)
