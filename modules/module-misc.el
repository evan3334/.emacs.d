(use-package csv-mode
  :defer t)

(use-package yaml-mode
  :defer t)

(use-package ediff
  :defer t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package debbugs
  :commands (debbugs-gnu))

(use-package disk-usage
  :commands (disk-usage disk-usage-here))

(use-package ace-window
  :commands (ace-window
	     ace-window-display-mode)
  :config
  (setq aw-dispatch-always t
	aw-display-mode-overlay nil
	aw-background nil)
  :bind ("C-x C-o" . ace-window)
  :hook (emacs-startup . ace-window-display-mode))

(use-package dired
  :config (setq dired-dwim-target t))

(use-package transient
  :init
  (defun find-code-dir ()
    (interactive)
    (find-file "~/Sync/code/"))
  (defun find-school-dir ()
    (interactive)
    (find-file "~/Sync/school/"))
  (defun find-guix-dir ()
    (interactive)
    (find-file "~/Sync/code/guix/"))
  (defun find-init-module ()
    (interactive)
    (let ((default-directory "~/.emacs.d/modules/"))
      (call-interactively 'find-file)))
  (defun find-manifest-file ()
    (interactive)
    (let ((default-directory "~/Sync/code/manifest/"))
      (call-interactively 'find-file)))
  (defun find-dotfiles ()
    (interactive)
    (let ((default-directory "~/Sync/code/dotfiles/"))
      (call-interactively 'find-file)))
  (defun visit-file-truename ()
    (interactive)
    (if (eq major-mode 'dired-mode)
	(find-file (file-truename default-directory))
      (if (buffer-file-name)
	  (find-file (file-truename (buffer-file-name)))
	(message "Buffer is not visiting a file!"))))
  :config
  (define-transient-command quick-goto ()
    "Quickly runs a command from a popup window."
    ["Common directories and files"
     ("c" "Open code directory" find-code-dir)
     ("s" "Open school directory" find-school-dir)
     ("g" "Open guix checkout" find-guix-dir)]
    ["Find configuration files"
     ("i" "Open init file" open-init-file)
     ("m" "Open init module" find-init-module)
     ("d" "Open dotfile" find-dotfiles)
     ("p" "Open Guix manifest file" find-manifest-file)]
    ["Common commands"
     ("a" "Org Agenda" org-agenda)
     ("M" "Mail" gnus)
     ("f" "Visit linked file" visit-file-truename)])
  :bind ("C-<menu>" . quick-goto))

(setq enable-remote-dir-locals t)

(use-package tramp
  :config
  (let ((process-environment tramp-remote-process-environment))
    (setenv "ENV" "$HOME/.profile")
    (setq tramp-remote-process-environment process-environment)))

(global-set-key (kbd "C-x <f5>") #'revert-buffer)
  
(provide 'module-misc)
