(defun vc-git-grep-improved (regexp)
  (interactive "sRegexp:")
  (vc-git-grep regexp "*" (textmate-project-root)))

(provide 'git-grep)
