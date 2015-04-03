;;; init.el

;; Author: Jason Hamilton

;;; Commentary:

;;; Code:

;; ************************************************************************
;; * initial display stuff so things don't flash all funky
;; ************************************************************************
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(blink-cursor-mode -1)

;; in order to load init other init files
(add-to-list 'load-path (expand-file-name "~/.emacs.d/laydros-lisp"))

;;(set-default-font "Terminus-10")
;; (set-default-font "Inconsolata-10")
;; (set-default-font "DejaVu Sans Mono-9")
(set-default-font "Source Code Pro-10")
;; ************************************************************************
;; *  package manager
;; ************************************************************************
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(defun laydros-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

;; ************************************************************************
;; * Themes
;; * - the first step is admitting you have a problem
;; ************************************************************************
(laydros-require-package 'naquadah-theme)
(require 'naquadah-theme)

;; (require 'molokai-theme)
;; (laydros-require-package 'monokai-theme)
;; (require 'monokai-theme)

;; (laydros-require-package 'zenburn-theme)
;; (require 'zenburn-theme)

;; ************************************************************************
;; * - Elpy -
;; ************************************************************************
(laydros-require-package 'elpy)
(elpy-enable)
(elpy-use-ipython)

;; ************************************************************************
;; * - Auto-complete -
;; ************************************************************************
; (laydros-require-package 'auto-complete)
; (require 'auto-complete-config)
; (ac-config-default)

;; company is supposed to be better, but it is getting on my nerves
;; jwh-2014-10-06
; (laydros-require-package 'company)
; (require 'company)

;; (setq company-idle-delay 0.5)
;; (setq company-tooltip-limit 10)
;; (setq company-minimum-prefix-length 2)
;; ;; invert the navigation direction if the completion popup-isearch-match
;; ;; is displayed on top (happens near the bottom of the windows)
;; (setq company-tooltip-flip-when-above 1)

;; (global-company-mode 1)


;; ************************************************************************
;; * - undo-tree -
;; ************************************************************************
(laydros-require-package 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)


;; ************************************************************************
;; * - ido -
;; * Ido mode provides a nice way to navigate the filesystem. This is mostly
;; * just turning it on.
;; ************************************************************************
(laydros-require-package 'ido)
(laydros-require-package 'flx-ido)
(require 'ido)
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
;; hide ido faces to see flx-ido highlights
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t
      ibuffer-shrink-to-minimum-size t
      ibuffer-sorting-mode 'recency
      ido-use-virtual-buffers t)
(laydros-require-package 'ido-vertical-mode)
(ido-vertical-mode t)

;; ************************************************************************
;; * - iedit -
;; ************************************************************************
(laydros-require-package 'iedit)
(require 'iedit)

;; ************************************************************************
;; * - projectile -
;; ************************************************************************
(laydros-require-package 'projectile)
(projectile-global-mode)

;; ************************************************************************
;; * - magit -
;; ************************************************************************
(laydros-require-package 'magit)
(require 'magit)

;; ************************************************************************
;; * - git-gutter-fringe - 
;; ************************************************************************
(laydros-require-package 'git-gutter-fringe)
(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

;; ************************************************************************
;; * - powerline -
;; ************************************************************************
(require 'powerline)

;; ************************************************************************
;; * - nlinum -
;; ************************************************************************
(laydros-require-package 'nlinum)
(global-nlinum-mode t)

;; Preset width nlinum - should prevent horizontal jumps when scrolling
(add-hook 'nlinum-mode-hook
          (lambda ()
            (setq nlinum--width
              (length (number-to-string
                       (count-lines (point-min) (point-max)))))))

;; ************************************************************************
;; * - General -
;; ************************************************************************
(setq user-mail-address "jwh@laydros.net")

;; run in server mode
(server-start)

(laydros-require-package 'autopair)
(require 'autopair)

(setq visible-bell t)
(display-time-mode 1)

;; I always use 4 tabs as spaces. this is PEP-8 and feels right for other stuff
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)

;; transient should be on by default as of emacs 23.2
;; (setq transient-mark-mode t)
(setq global-font-lock-mode 1)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; fill column tells me where to stop. PEP-8 calls for 80 columns or less, and
;; I just let this carry into all of my text editing
(laydros-require-package 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq-default fill-column 79)

(show-paren-mode t)

;; for tramp
(setq tramp-default-method "ssh")

(auto-compression-mode 1)

;; watch visited files for changes and reload if needed
(setq
 global-auto-revert-mode 1
 require-final-newline t
 inhibit-startup-screen t

 initial-scratch-message ";;_
;;                 __         _,******
;;   ,-----,        _  _,**
;;   | Mu! |          _   ____,****
;;   ;-----;        _
;;        \\   ^__^
;;         \\  (^^)\\_______
;;          ^-(..)\\       )\\/\\/^_^
;;                ||----w |
;; __.-''*-,.,____||_____||___,_.-
;;                 ''     ''

")

;; get rid of backup files
(setq make-backup-files nil)

;; y and n instead of yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

(defun comment-or-uncomment-region-or-line ()
  "Like comment-or-uncomment-region, but if there's no mark \(that means no
region\) apply comment-or-uncomment to the current line"
  (interactive)
  (if (not mark-active)
      (comment-or-uncomment-region
       (line-beginning-position) (line-end-position))
    (if (< (point) (mark))
        (comment-or-uncomment-region (point) (mark))
      (comment-or-uncomment-region (mark) (point)))))

;; makes temporary files go away
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; track recently-opened files
(recentf-mode 1)
(setq recentf-max-menu-items 100)

;; uniquify for buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; function to hide ^M characters in mixed line ending files
(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; never quit accidentally
(setq confirm-kill-emacs 'yes-or-no-p)

;; load images as images
(auto-image-file-mode 1)

;; ************************************************************************
;; * - UTF-8 -
;; ************************************************************************

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;; ************************************************************************
;; * - Key Bindings -
;; ************************************************************************
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; (global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-c\C-r" 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region-or-line)

;; ************************************************************************
;; * - External loads -
;; * stuff in external init files
;; ************************************************************************

;; mu4e config
(require 'laydros-mu4e)
;; load org-mode stuff
(require 'laydros-org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(calendar-week-start-day 0)
 '(case-fold-search t)
 '(custom-safe-themes
   (quote
    ("e3378d36c11449a4ad5361af6144036478265c53af00fb23400e674bb91ca33f" "1c6c7d5e4beaec0a54d814454106d180de7b90f8961d3edd2f6567f7c08da97e" "ef43b291f7e96826d3d9bae61434a93020d0f529d609bc8be5b331980e8448d7" default)))
 '(make-backup-files nil)
 '(org-agenda-files
   (quote
    ("/home/laydros/Dropbox/Documents/org/work.org" "~/Dropbox/Documents/org/organizer.org" "/home/laydros/Dropbox/Documents/org/personal.org")))
 '(org-agenda-show-all-dates t)
 '(org-tags-column -78))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
