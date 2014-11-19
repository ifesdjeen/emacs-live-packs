;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(live-add-pack-lib "/xcscope/")

(require 'xcscope)
(cscope-setup)



(setq c-default-style "gnu"
      c-basic-offset 2)
