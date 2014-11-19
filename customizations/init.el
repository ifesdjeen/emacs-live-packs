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

;; (require 'hs-lint)

;; (setq flymake-gui-warnings-enabled nil)





;;
;; Company Mode
;;

(live-add-pack-lib "/async/")
(live-add-pack-lib "/helm/")

(require 'helm-config)

(helm-mode 1)

(global-set-key (kbd "C-x C-b")   'helm-buffers-list)
(global-set-key (kbd "M-/")       'helm-dabbrev)

(live-add-pack-lib "/company-mode/")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; (delete 'company-semantic company-backends)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-gtags)
(add-to-list 'company-backends 'company-files)
(add-to-list 'company-backends 'company-etags)
(add-to-list 'company-backends 'company-clang)
(add-to-list 'company-backends 'company-dabbrev)
(add-to-list 'company-backends 'company-dabbrev-code)

(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (global-set-key [tab] 'company-complete)


(setq company-clang-arguments
      '("-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1"
        "-I/usr/local/include"
        "-I/Users/ifesdjeen/hackage/write_nanomsg/collectd/src"
        "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/5.1/include"
        "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"
        "-I/usr/include"
        "-I/Users/ifesdjeen/foss/c/glibc/include"))

(setq company-c-headers-path-system
      '("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/5.1/include"))
