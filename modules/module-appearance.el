;; -----------------
;; Configure themes
;; -----------------
(require 'doom-themes)
(require 'all-the-icons)
(require 'doom-modeline)

(defconst dark-theme 'doom-molokai)
(defconst light-theme 'doom-tomorrow-day)


(defcustom dark-mode t
  "Whether or not 'dark mode' should be activated, which uses a dark theme instead
of a light theme."
  :type '(boolean))

(defun doom-themes-configuration ()
  "`doom-themes-configuration' is interactive by the modeline, it will
start the nice defaults for the theme and establish `doom-modeline-mode'."
  (interactive)
  (if dark-mode
      (load-theme dark-theme t)
    (load-theme light-theme t))
  (setq doom-themes-enable-bold t      ; If nil, bold is universally disabled
	doom-themes-enable-italic t)   ; If nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-modeline-mode)
  (setq doom-modeline-buffer-file-name-style 'file-name))

(defun dark-mode-on ()
  (interactive)
  (customize-save-variable 'dark-mode t)
  (doom-themes-configuration))

(defun dark-mode-off ()
  (interactive)
  (customize-save-variable 'dark-mode nil)
  (doom-themes-configuration))

(defun dark-mode-toggle ()
  (interactive)
  (if light-mode
      (dark-mode-off)
    (dark-mode-on)))

;;(set-face-attribute 'default nil
;;		    :family "Source Code Pro"
;;		    :height 120
;;		    :width 'normal
;;		    :weight 'semi-bold)


(doom-themes-configuration) ; Execute `doom-themes-configuration'

(provide 'module-appearance)
