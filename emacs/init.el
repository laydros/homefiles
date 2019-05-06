;; Whatever, nuke it all. 2018-09-21 - JWH

;; TODO: I need emacs to support sdate and fdate - maybe yasnippit?

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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

;; don't need to say ensure when using use-package
(setq use-package-always-ensure t)

(setq user-full-name "Jason Hamilton")
(setq user-mail-address "jwh@laydros.net")

(add-to-list 'default-frame-alist
             '(font . "Inconsolata-11"))

;;
;; interface
;;

(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(electric-pair-mode t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode  -1))
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default fill-column 80)
(setq
 inhibit-startup-message t
 inhibit-startup-screen t
 confirm-kill-emacs 'y-or-n-p
 ;; select help window so it's easy to quit it with 'q'
 help-window-select t)

(setq
 select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t
 mouse-yank-at-point t)

(setq dired-dwim-target t)

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
(set-language-environment "UTF-8")

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq
 make-backup-files nil
 create-lockfiles nil)

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
(setq-default c-basic-offset 4)
(setq-default tab-width 2)

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)

;;
;; packages
;;

(use-package helm
  :ensure t
  :config
  (require 'helm-config))

(use-package magit
  :ensure t
  :init (bind-key "C-x g" 'magit-status))

(use-package better-defaults
  :ensure t
  :config
  (menu-bar-mode 1)
  (scroll-bar-mode 1))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

;;; Get help as you go
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; Mickey P from Mastering Emacs discover.el
(use-package discover
  :ensure t
  :config
  (global-discover-mode 1))

;;; Distinguished parenthesis
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'lisp-mode-hook (lambda () (rainbow-delimiters-mode)))
  (add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode)))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package mastodon
  :ensure t
  :config
  (setq mastodon-instance-url "https://mastodon.sdf.org")
  (mastodon-discover))

(use-package company
  :ensure t
  :init
  ;; https://emacs.stackexchange.com/a/10838
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;;; Mode line
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'slant)
  (spaceline-spacemacs-theme))


;;; fix for macOS where there isn't a login shell
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; elpy - let's try this again
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )

;; I haven't yet figured out the right way to do this with use-package
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(use-package flycheck
  :ensure t
  :config
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))



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

;; org-mode keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; lets you start new entry when cursor is in the middle of the line (I think)
(setq org-M-RET-may-split-line nil)

(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/tasks.org")
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %u\n  %a")
        ("n" "Note/Data" entry (file+headline "inbox.org" "Notes/Data")
         "* %?   \n  %i\n  %u\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ("J" "Work-Journal" entry (file+datetree "~/Dropbox/org/wjournal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ))
(setq org-irc-link-to-logs t)


(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "IN-PROGRESS" "WAIT(w@/!)" "|" "DONE" "CANCELED"))
)


;; install htmlize for org to output more complicated stuff to html. may be useful for other cases
(use-package htmlize
  :ensure t)

;;; Fancy visuals for org-mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq tramp-default-method "ssh")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(provide 'init)
