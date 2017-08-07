;; A very basic emacs config. Might try to use on servers I often use.

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

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

;; end basics

(set-default-font "Knack Nerd Font-11")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/laydros-lisp"))

(load-theme 'solarized-dark t)

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

;;(require 'laydros-base)

;; helps to actually look at the documentation. Use M-n and M-p to select,
;; <return> to complete or <tab> to complete the common part. Search through
;; completions with C-s, C-r and C-o. Press M-(digit) to quickly complete with
;; one of the first 10 candidates. When completion candidates are shown, press
;; <f1> to display the documentation for the selected candidate, or C-w to see
;; it's source.
(add-hook 'after-init-hook 'global-company-mode)

(ido-mode 1)
(setq ido-enable-flex-matching t)
;; may want to get rid of this
(setq ido-everywhere t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; use the system trash
(setq delete-by-moving-to-trash t)
