;; -*- lexical-binding: t; -*-

;; --------------
;; Disable all mouse-interactive interfaces early.
;; --------------
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; ----------------
;; Configure package sources
;; ----------------
(require 'package)
;; Add MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(eval-when-compile
  (require 'use-package))

;; ---------------
;; Keep generated settings in a separate file.
;; ---------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; ---------------
;; Install selected packages that aren't installed
;; ---------------
(defun ensure-packages-installed (packages)
  "Installs a list of packages if they aren't already installed."
  (when (not (eq packages nil))
    (let ((package (car packages)))
      (when (not (package-installed-p package))
	  (package-install package)))
    (ensure-packages-installed (cdr packages))))

(condition-case nil
  (ensure-packages-installed package-selected-packages)
  (error
   (package-refresh-contents)
   (ensure-packages-installed package-selected-packages)))

(setq modules-dir
      (expand-file-name "modules" user-emacs-directory))

(add-to-list 'load-path modules-dir)

(defun open-dotfile ()
  "Opens the init.el file quickly."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key "\C-c\C-d" 'open-dotfile)

(require 'module-appearance)
(require 'module-lang-general)
(require 'module-lang-java)
(require 'module-lang-c-c++)
(require 'module-lang-scheme)
(require 'module-pdf)
