;; Whatever, nuke it all. 2018-09-21 - JWH

;; TODO: I need emacs to support sdate and fdate - maybe yasnippit?

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
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

;; (add-to-list 'default-frame-alist
;;              '(font . "Inconsolata-12"))

;; (setq mac-allow-anti-aliasing nil)
;; (set-frame-font "-apple-Dina-medium-normal-normal--16--*-*-m-0-iso10646-1")

;; Check if system is Darwin/macOS
(defun my-system-is-darwin ()
  "Return true if system is darwin-based (Mac OS X)"
  (string-equal system-type "darwin")
  )

;; Check if system is GNU/Linux
(defun my-system-is-gnu ()
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux")
  )

;; Check if the hostname is mynotebook
(defun my-system-is-mynotebook ()
  "Return true if the system we are running on is mynotebook"
  (or
    (string-equal system-name "mynotebook")
    (string-equal system-name "mynotebook.lan")
    )
  )

(when (my-system-is-gnu)
  (add-to-list 'default-frame-alist
               '(font . "Hack-9")))

(when (my-system-is-darwin)
  (add-to-list 'default-frame-alist
               '(font . "Hack-12")))

;; (cond ((eq system-type 'gnu/linux)
;;        (add-to-list 'default-frame-alist
;; 		    '(font . "Hack-9"))
;;        )
;;       ((eq system-type 'darwin)
;;        (add-to-list 'default-frame-alist
;; 		    '(font . "Hack-12"))
;;        ))

;;
;; desktop
;; - options to save open desktop

(setq desktop-dirname  "~/.emacs.d/desktop/"
      ;; desktop-files-not-to-save  "^$"  ; <- stackoverflow comment said "reload tramp paths"
      ;; desktop-files-not-to-save  ".*magit$"
      desktop-base-file-name     "emacs.desktop"
      desktop-base-lock-name     "emacs.lock"
      desktop-restore-eager      20
      desktop-path               (list desktop-dirname))
(desktop-save-mode t)

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
 scroll-conservatively 80       ;; only move the screen a little when scrolling to the end of the view
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

;; Holy crap, this works through tmux, allows scrolling and placing the cursor
(when (eq window-system nil)
  (xterm-mouse-mode t))

;;
;; files
;;

(global-auto-revert-mode t)

;; warn when opening files bigger than 100MB instead of 10MB
(setq large-file-warning-threshold 100000000)

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
(setq-default css-indent-offset 2)

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
;; I never use this, it's still available at C-x C-z
(global-unset-key (kbd "C-z"))

(defun insert-sdate () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))
(defun insert-fdate () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d_%H-%M-%S)")))

;;
;; packages
;;

(use-package avy
  :config
  (global-set-key (kbd "C-'") 'avy-goto-char))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package helm
  :config
  (require 'helm-config))

(use-package magit
  :init (bind-key "C-x g" 'magit-status))

(use-package undo-propose)

(use-package better-defaults
  :config
  (menu-bar-mode 1)
  (scroll-bar-mode 1))

(use-package beacon
  :config
  (beacon-mode 1))

;;; Get help as you go
(use-package which-key
  :config
  (which-key-mode))

;;; Mickey P from Mastering Emacs discover.el
(use-package discover
  :config
  (global-discover-mode 1))

;;; Distinguished parenthesis
(use-package rainbow-delimiters
  :config
  (add-hook 'lisp-mode-hook (lambda () (rainbow-delimiters-mode)))
  (add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode)))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package mastodon
  :config
  (setq mastodon-instance-url "https://mastodon.sdf.org")
  (mastodon-discover))

(use-package company
  :init
  ;; https://emacs.stackexchange.com/a/10838
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))

(use-package emms
  :config
  (emms-all)
  ;; (emms-default-players)
  (setq emms-player-list '(emms-player-mpv emms-player-mpg321 emms-player-ogg123 emms-player-mplayer-playlist emms-player-mplayer emms-player-vlc emms-player-vlc-playlist))
  (setq emms-source-file-default-directory "~/Dropbox/music/"))

;; (use-package spacemacs-theme
;;   :defer t
;;   :init (load-theme 'spacemacs-dark t))

;; (cond ((display-graphic-p)
;;        )
;;       ;; graphical code goes here
;;       (use-package modus-operandi-theme
;;         :defer t
;;         :init (load-theme 'modus-operandi t))
;;       (t
;;        ;; Console-specific code

;;        ))

(use-package modus-operandi-theme
  :defer t
  :init (load-theme 'modus-operandi t))

;;; Mode line
(use-package spaceline
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
  :init
  (elpy-enable)
  )

;; I haven't yet figured out the right way to do this with use-package
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(use-package flycheck
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

;; auto save org files
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; invisible edits - tweaks when headers are folded
(setq org-catch-invisible-edits 'show-and-error)

;; org directory stuff
(setq org-agenda-files (quote("~/org")))
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/tasks.org")
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %u\n  %a")
        ("n" "Note/Data" entry (file+headline "inbox.org" "Notes/Data")
         "* %?   \n  %i\n  %u\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ("J" "Work-Journal" entry (file+datetree "~/org/wjournal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ))
(setq org-irc-link-to-logs t)


(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS" "WAIT(w@/!)" "|" "DONE" "CANCELED"))
)


;; install htmlize for org to output more complicated stuff to html. may be useful for other cases
(use-package htmlize)

;; turns out orgs built in indent mode does what I like about bullets
(add-hook 'org-mode-hook 'org-indent-mode)

(setq tramp-default-method "ssh")

;;
;; mail
;;

;; smtpmail
(setq
 message-send-mail-function   'smtpmail-send-it
 smtpmail-default-smtp-server "smtp.fastmail.com"
 smtpmail-smtp-server         "smtp.fastmail.com")

;; mu4e setup
;; path for macOS
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
;; path for ubuntu
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(require 'mu4e)

(setq
 mu4e-headers-skip-duplicates t
 mu4e-view-show-images t
 mu4e-view-show-addresses t
 mu4e-compose-format-flowed nil
 mu4e-date-format "%y-%m-%d"
 mu4e-headers-date-format "%Y-%m-%d"
 mu4e-change-filenames-when-moving t
 mu4e-attachment-dir "~/Downloads"

 mu4e-maildir "~/var/Maildir"    ;; top-level Maildir
 ;; note that these folders below must start with /
 ;; the paths are relative to the maildir root
 mu4e-refile-folder "/Archive"
 mu4e-sent-folder   "/Sent"
 mu4e-drafts-folder "/Drafts"
 mu4e-trash-folder  "/Trash")

;; this allows to re-sync and re-index maildir
;; by pressing U
(setq mu4e-get-mail-command "mbsync -a")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(provide 'init)
