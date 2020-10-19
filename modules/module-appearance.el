;; -----------------
;; Configure fonts
;; -----------------


;; -----------------
;; Configure themes
;; -----------------

(defvar dark-theme 'doom-outrun-electric "The theme to use when in dark mode.")
(defvar light-theme 'doom-acario-light "The theme to use when not in dark mode.")

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
  :config
  (setq doom-themes-enable-bold t      ; If nil, bold is universally disabled
	doom-themes-enable-italic t)   ; If nil, italics is universally disabled
  (doom-themes-init))

(use-package all-the-icons
  :after (doom-themes))

(use-package flymake
  :config (set-face-attribute 'flymake-warning nil :underline '(:color "yellow" :style wave)))

(use-package doom-modeline
  :init
  (defun doom-modeline-daemon (_frame)
    "`doom-modeline' strangely does not behave in a daemon-session.
So we need to fix this ourselves."
    (setq doom-modeline-icon t)
    (setq doom-modeline-height 35)
    (message "doom-modeline fixed"))
  (add-hook 'after-make-frame-functions #'doom-modeline-daemon)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-mode)
  (doom-modeline-refresh-bars)
  :after (doom-themes all-the-icons))

(use-package org
  :commands (org-agenda)
  :config
  (set-face-attribute 'org-column nil :background nil)
  (set-face-attribute 'org-column-title nil :background nil))

;; allow splitting narrower windows
(setq split-width-threshold 154)

;; fix font
(set-face-attribute 'default nil :height 110 :width 'normal)

(provide 'module-appearance)
