(defun kill-current-buffer ()
  "Kill the current buffer without confirmation unless explicitly modified."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x w") 'kill-current-buffer)
(global-set-key "\C-q" 'kill-current-buffer)

(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\C-y" 'clipboard-yank)

;;
;; Navigation
;;

(global-set-key [S-M-left] 'tabbar-backward-tab)
(global-set-key [S-M-right] 'tabbar-forward-tab)

(global-set-key [?\C-x ?\C-g] 'goto-line) ;; goto line
(global-set-key [?\C-x ?\C-b] 'ibuffer) ;; great buffer switcher

(global-set-key "\C-xp" 'previous-multiframe-window)
(global-set-key (kbd "C-<") 'previous-multiframe-window)
(global-set-key (kbd "C->") 'next-multiframe-window)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;;
;; Text-editing
;;

(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c!" 'revert-buffer)

(defun shift-right (arg)
  "Shift selection right"
  (interactive "p")
  (save-excursion
    (let ((deactivate-mark nil))
      (indent-rigidly (min (point) (mark))
                      (max (point) (mark))
                      2))))

(defun shift-left (arg)
  "Shift selection left"
  (interactive "p")
  (save-excursion
    (let ((deactivate-mark nil))
      (indent-rigidly (min (point) (mark))
                      (max (point) (mark))
                      (- 2)))))

(global-set-key (kbd "M-DEL") 'backward-kill-word)
(global-set-key (kbd "C-M-h") 'backward-kill-word)

(defun iwb ()
  "Indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun cljt-pp ()
  ""
  (clojure-test-previous-problem))

(defun cljt-np ()
  ""
  (clojure-test-next-problem))

(setq default-tab-width 2)
(setq soft-tab-size 2)
(setq tab-size 2)

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

;;(global-unset-key "\C-c\C-c")
;;(global-set-key  "\C-c\C-c" 'nrepl-eval-expression-at-point)

(global-set-key "\M-p" 'scroll-down)
(global-set-key "\M-n" 'scroll-up)


(defun split-3-windows ()
  (interactive)
  (command-execute 'delete-other-windows)
  (command-execute 'split-window-horizontally)
  (command-execute 'next-multiframe-window)
  (command-execute 'split-window-vertically)
  (command-execute 'balance-windows))

(global-set-key (kbd "C-x 4") 'split-3-windows)


(defun split-3-windows-horisontally ()
  (interactive)
  (command-execute 'delete-other-windows)
  (command-execute 'split-window-horizontally)
  (command-execute 'next-multiframe-window)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows))

(global-set-key (kbd "C-x 5") 'split-3-windows-horisontally)

;;
;; Clojure mode
;;

(global-set-key (kbd "C-x C-z") 'cider-switch-to-repl-buffer)
(global-set-key (kbd "C-x C-e") 'cider-eval-region)

(global-set-key (kbd "<right>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "<left>") 'paredit-forward-barf-sexp)

;;
;; Integration with terminal
;;

(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

(define-key input-decode-map "\e[1;9A" [M-up])
(define-key input-decode-map "\e[1;9B" [M-down])
(define-key input-decode-map "\e[1;9C" [M-right])
(define-key input-decode-map "\e[1;9D" [M-left])

(define-key input-decode-map "\e[1;10A" [M-S-up])
(define-key input-decode-map "\e[1;10B" [M-S-down])
(define-key input-decode-map "\e[1;10D" [M-S-left])
(define-key input-decode-map "\e[1;10C" [M-S-right])

(define-key input-decode-map "[OA" (kbd "<M-C-up>"))
(define-key input-decode-map "[OB" (kbd "<M-C-down>"))
(define-key input-decode-map "[OC" (kbd "<M-C-right>"))
(define-key input-decode-map "[OD" (kbd "<M-C-left>"))


;;
;; Undo / Redo
;;

(global-set-key (kbd "C-?") 'undo-tree-undo)
(global-set-key (kbd "C-x C-_") 'undo-tree-redo)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-c SPC") 'ace-jump-char-mode)
;;(define-key global-map (kbd "C-u C-c SPC") 'ace-jump-char-mode)
;; (define-key global-map (kbd "C-u C-u C-c SPC") 'ace-jump-line)

;;
;; Multiple-cursors
;;

(global-unset-key "\C-xm")

(defcustom mc-keyboard-prefix "\C-xm"
  "Keyboard prefix to use for global mc keyboard commands."
  :type 'string
  :group 'mc-emacs)

(define-prefix-command 'mc-global-map)

(define-key global-map mc-keyboard-prefix 'mc-global-map)

(global-unset-key (kbd "<down>"))
(global-set-key (kbd "<down>") 'mc/mark-next-like-this)

(define-key mc-global-map "a" 'mc/mark-next-like-this)
(define-key mc-global-map "y" 'yank-rectangle)
(define-key mc-global-map "s" 'set-rectangular-region-anchor)

(define-key mc-global-map "ma" 'mc/mark-all-like-this)
(define-key mc-global-map "el" 'mc/edit-lines)

;; (define-key mc-global-map "" 'mc/mark-next-like-this)
;; (define-key mc-global-map "" 'mc/mark-next-word-like-this)
;; (define-key mc-global-map "" 'mc/mark-next-symbol-like-this)
;; (define-key mc-global-map "" 'mc/mark-previous-like-this)
;; (define-key mc-global-map "" 'mc/mark-previous-word-like-this)
;; (define-key mc-global-map "" 'mc/mark-previous-symbol-like-this)
;; (define-key mc-global-map "" 'mc/mark-more-like-this-extended)
;; (define-key mc-global-map "" 'mc/add-cursor-on-click)

;;
;; Textmate
;;

(global-unset-key "\C-xt")

(defcustom textmate-keyboard-prefix "\C-xt"
  "Keyboard prefix to use for global textmate-mode keyboard commands."
  :type 'string
  :group 'textmate-mode)

(define-prefix-command 'textmate-global-map)
(define-key global-map textmate-keyboard-prefix 'textmate-global-map)

(define-key textmate-global-map "t" 'textmate-goto-file)
(define-key textmate-global-map "s" 'textmate-goto-symbol)
(define-key textmate-global-map "[" 'textmate-shift-left)
(define-key textmate-global-map "]" 'textmate-shift-right)
(define-key textmate-global-map "a" 'auto-complete)

(define-key textmate-global-map "r" 'transpose-sexps)
(define-key textmate-global-map "w" 'transpose-words)
(define-key textmate-global-map "c" 'comment-or-uncomment-region-or-line)
(define-key textmate-global-map ";" 'toggle-keyword-string)


(define-key textmate-global-map "e" 'nrepl-eval-expression-at-point)

;;
;; Magit
;;

(global-unset-key "\C-\M-h")
(global-set-key "\C-\M-h" 'backward-kill-word)

(global-unset-key "\C-xg")
(global-set-key "\C-xg" 'vc-git-grep-improved)

;;
;;
;;
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)


(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)


(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode t)))



(define-key paredit-mode-map (kbd "M-]")     'paredit-forward)
;; (define-key paredit-mode-map (kbd "M-[")     'paredit-backward)

;; (define-key paredit-mode-map (kbd "C-c p")  'nrepl-previous-input)
;; (define-key paredit-mode-map (kbd "C-c n")  'nrepl-next-input)

;; (defun nrepl-reset ()
;;   (interactive)
;;   (set-buffer "*nrepl*")
;;   (goto-char (point-max))
;;   (insert "(user/reset)")
;;   (nrepl-return))

;; (global-set-key "\C-ck" 'nrepl-reset)


(global-unset-key "\C-o")
(defcustom org-mode-keyboard-prefix "\C-o"
  "Keyboard prefix to use for global org-mode keyboard commands."
  :type 'string
  :group 'org-mode)

(define-prefix-command 'org-mode-global-map)
(define-key global-map org-mode-keyboard-prefix 'org-mode-global-map)
(define-key org-mode-global-map "ih" 'org-insert-heading)
(define-key org-mode-global-map "n" 'org-add-note)
(define-key org-mode-global-map "a" 'org-agenda)




;;
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))


(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'clipboard-kill-region)

(global-unset-key (kbd "C-c C-w"))
(global-set-key (kbd "C-c C-w") 'er/expand-region)

(eval-after-load "cider-repl-mode"
  '(define-key cider-repl-mode-map (kbd "C-p") 'cider-repl-previous-input))

(eval-after-load "cider-repl-mode"
  '(define-key cider-repl-mode-map (kbd "C-n") 'cider-repl-next-input))



;; (eval-after-load "clojure-mode"
;;   '(define-key paredit-mode-map (kbd "M-p")     'live-paredit-previous-top-level-form))
;; (eval-after-load "clojure-mode"
;;   '(define-key paredit-mode-map (kbd "M-n")     'live-paredit-next-top-level-form))

(cljr-add-keybindings-with-prefix "C-c C-n")
