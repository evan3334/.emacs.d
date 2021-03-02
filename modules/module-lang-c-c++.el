(defun c-style-setup ()
  "Set up custom C styles."
  (c-add-style
   "sasha"
   '("bsd"
     (c-basic-offset . 4)
     (c-offsets-alist . ((substatement-open . 0)
			 (innamespace . 0)
			 (inclass . +)
			 (access-label . --))))))

(require 'google-c-style)

(use-package clang-format
  :init
  (defun clang-format-auto ()
	"Calls the appropriate clang-format function depending on
  whether or not a region is selected. If a region is selected,
  will apply clang-format-region to that region only; otherwise,
  will format the whole buffer."
	(interactive)
	(if (region-active-p)
		(clang-format-region (region-beginning) (region-end))
	  (clang-format-buffer)))
  :commands (clang-format-buffer
			 clang-format-region
			 clang-format-auto))

;; ---------------
;; CCLS configuration (C/C++)
;; ---------------

(use-package ccls
  :init
  ;; set up c styles
  (c-style-setup)
  ;; make it safe to set ccls-args in .dir-locals.el files
  ;;(put 'ccls-args 'safe-local-variable #'listp)
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0)
  (setq ccls-args '("--log-file=/tmp/ccls.log"
		    "-v=1"))
  ;;		    "--init={\"compilationDatabaseDirectory\": \"build\"}"))
  ;
;(setq ccls-initialization-options '(:clang (:extraArgs '("--gcc-toolchain" "/usr"))))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda ()
		   (require 'ccls)
		   (lsp)))
  :bind (:map c-mode-map
		 ("C-c C-f" . clang-format-auto)
		 :map c++-mode-map
		 ("C-c C-f" . clang-format-auto)))

(add-hook 'c-mode-common-hook '(lambda ()
				 (setq-default tab-width 4)))

(use-package cmake-mode)

(provide 'module-lang-c-c++)
