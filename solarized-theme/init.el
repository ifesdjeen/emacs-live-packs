;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")


;; (live-load-config-file "solarized.el")
;;(live-add-pack-lib "solarized-emacs")


(require 'color-theme)

(add-to-list 'load-path (concat (live-pack-lib-dir) "solarized-emacs"))

(color-theme-initialize)

(eval-after-load "color-theme"
  '(progn
     (require 'color-theme-solarized)
     (color-theme-solarized-dark)))
