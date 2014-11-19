;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(setenv "GOPATH" "/Users/ifesdjeen/bin/go")
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/Cellar/go/1.2.1/libexec/bin"))
(setq exec-path (append exec-path (list (expand-file-name "/usr/local/Cellar/go/1.2.1/libexec/bin"))))


(live-add-pack-lib "/go-mode.el/")
(live-add-pack-lib "/f/")
(live-add-pack-lib "/flycheck/")
(live-add-pack-lib "/goflymake/")
(live-add-pack-lib "/gocode/emacs")


(require 'go-flycheck)
(require 'go-mode)

;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
