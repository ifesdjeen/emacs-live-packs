(setq deft-extension "org")
(setq deft-directory "~/.deft")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-auto-save-interval 1000)
(global-set-key [f8] 'deft)

(defun my-org-mode-hook()
  (progn
    (flyspell-mode 1)
    (auto-fill-mode 1)))

(add-hook 'org-mode-hook 'my-org-mode-hook)
