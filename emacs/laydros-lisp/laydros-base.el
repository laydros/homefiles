;; laydros-base.el
;; basic setup stuff
;; last edited 2017-07-25

;; UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)

;; some interface niceties
(setq confirm-kill-emacs                  'y-or-n-p
      confirm-nonexistent-file-or-buffer  t
      mouse-yank-at-point                 t
      inhibit-startup-message             t
      inhibit-startup-echo-area-message   t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; by default tooltips open in seperate frame. to force emacs to use the echo
;; area exclusively uncomment the following
;; (tooltip-mode -1)
;; (setq tooltip-use-echo-area t)

(provide 'laydros-base)
;; base ends here
