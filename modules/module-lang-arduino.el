(use-package arduino-mode
  :defer t
  :hook (arduino-mode . (lambda ()
			  (flycheck-mode)
			  (rainbow-delimiters-mode)
			  (lsp))))

(defgroup lsp-arduino nil
  "LSP support for Arduino."
  :group 'lsp-mode)

(defcustom lsp-arduino-executable "arduino-language-server"
  "Path of the Arduino LSP executable."
  :group 'lsp-arduino
  :type 'string)

(defcustom lsp-arduino-compile-commands-dir nil
  "Path of the compile_commands.json file."
  :group 'lsp-arduino
  :type 'string)

(defcustom lsp-arduino-cli-config-path "~/.arduino15"
  "Path where the arduino-cli configuration file can be found."
  :group 'lsp-arduino
  :type 'string)

(defcustom lsp-arduino-fbqn nil
  "Fully Qualified Board Name (FBQN) that should be used."
  :group 'lsp-arduino
  :type 'string)

(defun arduino-lsp--server-command ()
  "Startup command for Arduino language server."
  (list lsp-arduino-executable
		(format "-cli-config=%s" lsp-arduino-cli-config-path)
		"-log"
		(when lsp-arduino-compile-commands-dir (format "-compile-commands-dir=%s" lsp-arduino-compile-commands-dir))
		(when lsp-arduino-fbqn (format "-fbqn=%s" lsp-arduino-fbqn))))

(use-package lsp-mode
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection #'arduino-lsp--server-command)
					:major-modes '(arduino-mode)
					:server-id 'arduino)))

(provide 'module-lang-arduino)
