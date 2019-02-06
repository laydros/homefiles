;; Whatever, nuke it all. 2018-09-21 - JWH

;; TODO: I need emacs to support sdate and fdate

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  ;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa-mirror" . "http://www.mirrorservice.org/sites/melpa.org/packages/"))
  (package-initialize))

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(setq multi-term-program "~/bin/ansi-term.sh")

;; don't need to say ensure when using use-package
(setq use-package-always-ensure t)

(setq user-full-name "Jason Hamilton")
(setq user-mail-address "jwh@laydros.net")

;;
;; interface
;;

(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(electric-pair-mode t)
(show-paren-mode t)
(tool-bar-mode  -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)
(setq-default fill-column 80)
(setq
 inhibit-startup-message t
 inhibit-startup-screen t
 confirm-kill-emacs 'y-or-n-p
 ;; select help window so it's easy to quit it with 'q'
 help-window-select t)

(ido-mode 1)
(setq ido-everywhere 1)
(setq ido-enable-flex-matching t)

;;
;; files
;;

(global-auto-revert-mode t)

;; Always use utf-8
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq
 make-backup-files nil
 require-final-newline t)

;; built in python.el
;; try using C-j instead of return
;; set to use ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

;;
;; editing and movement
;;

;; cursor movement stops in camelCase words
(global-subword-mode t)
;; indention
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq tab-width 2)

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)

;;
;; packages
;;

(require 'helm-config)

(use-package magit
  :ensure t
  :init (bind-key "C-x g" 'magit-status))

;;; Get help as you go
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; Distinguished parenthesis
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'lisp-mode-hook (lambda () (rainbow-delimiters-mode)))
  (add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode))))

(use-package company
  :ensure t
  :init
  ;; https://emacs.stackexchange.com/a/10838
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))

;;; Mode line
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'slant)
  (spaceline-spacemacs-theme))

;; spot4e config
;; (add-to-list 'load-path "/Users/laydros/src/projects/spot4e")
;; (require 'spot4e)

;; (setq spot4e-refresh-token "AQBDW0sdhgZc9puwe6GoF1l8EhZ7jebok8B5nEktyPUM0TLt1byTOdC5ihvAPY2hY75Vus2zVpstEDcYDTgGLsJV4JYbMdU0Gg1VhhPcjcaodoPGaeD9VWl-X8Uxoo9-q-A22A")

;; (run-with-timer 0 (* 60 59) 'spot4e-refresh)

;; what TODO
;; ido stuff, should be smoother when using C-x C-f

;; maybe do the literate programming thing for this so I have notes in it
;; possibly a new dotfiles repo?

;;;;;;;;;;;;;;
;; org-mode ;;
;;;;;;;;;;;;;;

;; <s <TAB> will insert the code block header

;; numbers on headers off by default for org export. can be changed on a file basis
;; add #+OPTIONS: num:t in a file to turn on
(setq org-export-with-section-numbers nil)

;; install htmlize for org to output more complicated stuff to html. may be useful for other cases
(use-package htmlize
  :ensure t)

;;; Fancy visuals for org-mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq tramp-default-method "ssh")

;; TODO - I don't remember what this means
;; (global-font-lock-mode 1)
;; This might be on by default now.
;; I know I want this but I don't quite remember what it does.
;; (transient-mark-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "6515fcc302292f29a94f6ac0c5795c57a396127d5ea31f37fc5f9f0308bbe19f" "5a45c8bf60607dfa077b3e23edfb8df0f37c4759356682adf7ab762ba6b10600" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(erc-autojoin-channels-alist (quote (("Freenode" "#emacs" "#devious" "#next-browser"))))
 '(erc-server "irc.freenode.net")
 '(package-selected-packages
   (quote
    (spaceline solarized-theme atom-dark-theme atom-one-dark-theme base16-theme doom-themes molokai-theme monokai-theme nofrils-acme-theme htmlize magit multi-term helm dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'dracula)
