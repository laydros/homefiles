;; laydros-base.el
;; basic setup stuff - could be used as a minimal init.el
;; last edited 2017-07-25

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq c-basic-offset 4)
(setq c-indent-level 4)
(setq tab-width 4)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default fill-column 80)

(define-key global-map (kbd "RET") 'newline-and-indent)

(display-time-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(setq confirm-kill-emacs         'y-or-n-p
      inhibit-startup-message    t)

(electric-pair-mode 1)                  ; auto insert closing bracket
(show-paren-mode 1)                     ; highlight matching bracket
;; make cursor movement stop in camelCase words
(global-subword-mode 1)

(provide 'laydros-base)
;; base ends here
