;; -----------------
;; Configure themes
;; -----------------

(defconst dark-theme 'doom-outrun-electric "The theme to use when in dark mode.")
(defconst light-theme 'doom-tomorrow-day "The theme to use when not in dark mode.")

(defcustom use-dark-mode t
  "Whether or not 'dark mode' should be activated, which uses a dark theme instead
of a light theme."
  :type '(boolean))

(defun doom-themes-init ()
  (if use-dark-mode
      (load-theme dark-theme t)
    (load-theme light-theme t))
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(defun dark-mode-on ()
  (interactive)
  (customize-save-variable 'use-dark-mode t)
  (doom-themes-init))

(defun dark-mode-off ()
  (interactive)
  (customize-save-variable 'use-dark-mode nil)
  (doom-themes-init))

(defun dark-mode-toggle ()
  (interactive)
  (if use-dark-mode
      (dark-mode-off)
    (dark-mode-on)))


(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t      ; If nil, bold is universally disabled
	doom-themes-enable-italic t)   ; If nil, italics is universally disabled
  (doom-themes-init))

(use-package all-the-icons
  :ensure t
  :after (doom-themes))

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-mode)
  :after (doom-themes all-the-icons))

(provide 'module-appearance)
