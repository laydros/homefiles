;; A very basic emacs config. Might try to use on servers I often use.

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/laydros-lisp"))

(require 'laydros-base)

(set-default-font "Iosevka Nerd Font-12")

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


(load-theme 'solarized-dark t)

;; UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)

;; some interface niceties
(setq confirm-nonexistent-file-or-buffer  t
      mouse-yank-at-point                 t
      inhibit-startup-echo-area-message   t)

;; by default tooltips open in seperate frame. to force emacs to use the echo
;; area exclusively uncomment the following
;; (tooltip-mode -1)
;; (setq tooltip-use-echo-area t)

(use-package company-mode
  :ensure t)

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

;; simply use M-o to switch windows, since this is done so often. Could also
;; use (windmove-default-keybindings) to make S-up, S-dn, etc. move.
(global-set-key (kbd "M-o") 'other-window)

(defalias 'yes-or-no-p 'y-or-n-p)

;; use the system trash
(setq delete-by-moving-to-trash t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package solarized-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
