;; trying to make a very basic .emacs for quick use

(line-number-mode 1)
(column-number-mode 1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode  -1))
(fset 'yes-or-no-p 'y-or-n-p)
(electric-pair-mode t)

(setq
 scroll-conservatively 80       ;; only move the screen a little when scrolling to the end of the view
 inhibit-startup-message t
 inhibit-startup-screen t
 ;; select help window so it's easy to quit it with 'q'
 help-window-select t
 make-backup-files nil)

;; basic autocompletion
(ido-mode 1)
(setq ido-everywhere 1)
(setq ido-enable-flex-matching 1)

;; cursor movement stops in camelCase words
(global-subword-mode t)
;; indention
(setq-default c-basic-offset 4)
(setq-default tab-width 2)
(setq-default css-indent-offset 2)

;; allows scrolling and placing the cursor
(when (eq window-system nil)
  (xterm-mouse-mode t))

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
;; I never use this, it's still available at C-x C-z
(global-unset-key (kbd "C-z"))
