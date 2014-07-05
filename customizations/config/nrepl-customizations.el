(require 'clojure-mode)
(require 'clojure-test-mode)
;; (require 'nrepl)

;; ;;
;; ;; Auto compile
;; ;;

;; (defun nrepl-auto-compile ()
;;   (if (eq major-mode 'clojure-mode)
;;       (nrepl-load-current-buffer)))

;; (defun nrepl-enable-auto-compile ()
;;   (make-local-variable 'after-save-hook)
;;   (add-hook 'after-save-hook 'nrepl-auto-compile))

;; (defun enable-nrepl-compile-hook ()
;;   (add-hook 'nrepl-connected-hook 'nrepl-enable-auto-compile))


;; ;;
;; ;; Auto Test Run
;; ;;

;; (defun clojure-test-run ()
;;   (if (and (boundp 'clojure-test-mode) clojure-test-mode)
;;       (progn
;;         (nrepl-load-current-buffer)
;;         (clojure-test-run-tests))))

;; (defun enable-clojure-test-run ()
;;   (make-local-variable 'after-save-hook)
;;   (add-hook 'after-save-hook 'clojure-test-run))

;; (defun enable-clojure-test-run-hook ()
;;   (add-hook 'nrepl-connected-hook 'enable-clojure-test-run))

;; (enable-clojure-test-run-hook)
;; (enable-nrepl-compile-hook)
