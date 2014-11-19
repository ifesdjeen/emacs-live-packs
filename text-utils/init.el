;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.


(load "textmate")
;; (load "ido-hacks")
(load "deft")

;; TODO maybe remove ido-hacks? Helm looks bit better
;; (require 'ido-hacks)
;; (ido-hacks-mode)

(require 'textmate)
(textmate-mode)

(live-load-config-file "deft.el")

;; Load bindings config
(live-load-config-file "bindings.el")
