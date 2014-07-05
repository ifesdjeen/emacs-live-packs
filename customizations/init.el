;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
;; (live-load-config-file "title.el")
(live-load-config-file "js2-mode.el")
(live-load-config-file "nrepl-customizations.el")

;;
;; Tabbar
;;

(require 'tabbar)

(custom-set-variables
 '(tabbar-background-color "black")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-scroll-left-button (quote ((" <") " =")))
 '(tabbar-scroll-right-button (quote ((" >") " =")))
 '(tabbar-separator (quote ("  |  ")))
 '(tabbar-use-images nil))

(require 'clojure-test-mode)
(require 'git-grep)
(require 'magit-blame)
(require 'quick-jump)


(global-git-gutter-mode 0)
