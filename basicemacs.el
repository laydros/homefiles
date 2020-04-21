;; trying to make a very basic .emacs for quick use

(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-pair-mode t)

(setq
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

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
;; I never use this, it's still available at C-x C-z
(global-unset-key (kbd "C-z"))
