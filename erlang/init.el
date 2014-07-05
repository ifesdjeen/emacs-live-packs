;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(live-add-pack-lib "/erlang/")
(live-add-pack-lib "/rebar.el/")

(setq        erlang-root-dir (car (file-expand-wildcards "/usr/local/Cellar/erlang/R16B")))
(setq load-path (cons "/usr/local/Cellar/erlang/R16B/lib/erlang/lib/tools-2.6.10/emacs" load-path))
(add-to-list 'exec-path      (car (file-expand-wildcards "/usr/local/Cellar/erlang/R16B/bin")))
(setq erlang-root-dir     (car (file-expand-wildcards "/usr/local/Cellar/erlang/R16B")))

(require 'erlang-start)
(require 'erlang)
(require 'erlang-eunit)
(require 'erlang-flymake)

(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
;; (custom-set-faces
;;  '(flymake-errline ((((class color)) (:background "Gray30"))))
;;  '(flymake-warnline ((((class color)) (:background "Gray20")))))


(require 'rebar)
;; (live-add-pack-lib "/distel/elisp")
;; (require 'distel)
;; (distel-setup)


;;
;; Rebarkeys
;;

(defun erlang-add-custom-key-bindings ()
  (local-set-key (kbd "\C-c\C-rc") 'rebar-compile)
  (local-set-key (kbd "\C-c\C-ru") 'rebar-eunit)
  (local-set-key (kbd "C-c ,") 'rebar-ct)
  )

(add-hook 'erlang-mode-hook 'erlang-add-custom-key-bindings)
