

(defvar emacsd-dir
  "~/emacs-live/"
  "Emacs directory")


(setq live-root-dir "~/emacs-live/")

(setq boot-file (concat emacsd-dir "init.el"))
(load boot-file)
