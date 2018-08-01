;; A very basic emacs config. Might try to use on servers I often use.

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))
  (add-to-list
   'package-archives
   '("elpy" . "https://jorgenschaefer.github.io/packages/"))
  (package-initialize))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/laydros-lisp"))

;; not supported until sept 2017 emacs 26 beta
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(require 'laydros-base)

;; (set-default-font "Menlo-12")

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq tramp-default-method "ssh")
(load-theme 'monokai t)

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

(global-auto-revert-mode 1)

;; By default tooltips open in seperate frame. to force emacs to use the echo
;; area exclusively uncomment the following
;; (tooltip-mode -1)
;; (setq tooltip-use-echo-area t)

;; Make eww rename buffers automatically, so it will open a new one when calling eww again
(when (fboundp 'eww)
  (progn
    (defun xah-rename-eww-hook ()
      "Rename eww browser's buffer so sites open in new page."
      (rename-buffer "eww" t))
    (add-hook 'eww-mode-hook 'xah-rename-eww-hook)))

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

(pdf-tools-install)

(use-package elpy
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))

  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter "-i --simple-prompt"))

(require 'laydros-global-keys)
(require 'cust-func)
;; simply use M-o to switch windows, since this is done so often. Could also
;; use (windmove-default-keybindings) to make S-up, S-dn, etc. move.
(global-set-key (kbd "M-o") 'other-window)
;; not sure why the site I found this on had a # in the middle, but here is a
;; note in case it's needed later
;; (global-set-key (kbd "C-;") #'comment-line)
(global-set-key (kbd "C-;") 'comment-line)

(defalias 'yes-or-no-p 'y-or-n-p)

(defalias 'list-buffers 'ibuffer)       ; make ibuffer default

;; use the system trash
(setq delete-by-moving-to-trash t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (htmlize magit monokai-theme markdown-mode solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
