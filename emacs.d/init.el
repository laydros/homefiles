;;; init.el
;;; Author: Jason Hamilton
;;; Code:

;; ************************************************************************
;; * initial display stuff so things don't flash all funky
;; ************************************************************************
(package-initialize)

;; in order to load init other init files
(add-to-list 'load-path (expand-file-name "~/.emacs.d/laydros-lisp"))
;; another way to do this
;; (add-to-list 'load-path (concat user-emacs-directory "elisp"))

;;(set-default-font "Terminus-10")
;; (set-default-font "Inconsolata-10")
;; (set-default-font "DejaVu Sans Mono-9")
;; (set-default-font "Source Code Pro-11")
;;(set-default-font "Hack-11")
(set-default-font "Iosevka-11")

(require 'jwh-base)

;; use dired-extra, included with emacs. still learning about this
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

;; (when (memq window-system '(mac nc))
;;  (exec-path-from-shell-initialize))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defun jwh-add-missing-package (name)
  (unless (package-installed-p name)
    (package-install name)))


;; ************************************************************************
;; * Themes
;; * - the first step is admitting you have a problem
;; ************************************************************************
;; (jwh-add-missing-package 'naquadah-theme)
;; (require 'naquadah-theme)
;; (load-theme 'plan9)
;; (jwh-add-missing-package 'monokai-theme)
;; (require-soft 'monokai-theme)
;; (jwh-add-missing-package 'zenburn-theme)
;; (require 'zenburn-theme)

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t))


(require 'jwh-extensions)
(require 'jwh-functions)
(require 'jwh-global-keys)
(require 'jwh)

;; need to go through these to avoid conflicts (almost certainly elpy)
;; (require 'lang-python)
;; (require 'lang-web)
;; (require 'lang-javascript)
;; (require 'lang-c)

;; mu4e config
(require 'laydros-mu4e)
;; load org-mode stuff
(require 'laydros-org)

;; ************************************************************************
;; * - Elpy -
;; ************************************************************************
;; (jwh-add-missing-package 'elpy)
(use-package elpy
  :config
  (elpy-enable)
  (elpy-use-ipython))

;; use nXML for XML, XHTML, and XSL.
;; 2015-07-01 +jwh+
;; (require 'nxml-mode)
;; (setq auto-mode-alist
;;       (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)

;; ************************************************************************
;; * - General -
;; ************************************************************************
(setq user-mail-address "jwh@laydros.net")

;; (setenv "SSH_ASKPASS" "/home/chris/bin/gnome-ssh-askpass")

;; run in server mode
;; (server-start)

;; jwh 2015-04-22
;; From emacs wiki to fix scrolling jumping
;; FINALLY, after many years of cursing, the suggestion of setting
;; auto-window-vscroll to nil, below on this page, worked - even though Emacs
;; documentation only says it applies to tall lines with large images, which I
;; don’t use. In fact it seems to apply to any scrolling with too-slow terminal
;; and too-fast keyboard repeat rate. So, here’s my tested recipe for civilized
;; scrolling, which works regardless of your screen speed and keyboard speed:
(setq scroll-step 1
      scroll-conservatively 10000
      auto-window-vscroll nil)


;; I always use 4 tabs as spaces. this is PEP-8 and feels right for other stuff
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; possibly the nuclear option to fix tabs                                     |         |
;; (setq indent-line-function 'insert-tab)

(setq global-font-lock-mode 1)

(display-time-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; fill column tells me where to stop. PEP-8 calls for 80 columns or less, and
;; I just let this carry into all of my text editing
(jwh-add-missing-package 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq-default fill-column 79)

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

;; makes temporary files go away
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; track recently-opened files
(recentf-mode 1)
(setq recentf-max-menu-items 100)

;; load images as images
(auto-image-file-mode 1)

(setq dired-auto-revert-buffer t)
(setq display-time-24hr-format t)

;; (setq 'select-active-regions nil)
;; (setq 'shift-select-mode nil)
;; (setq 'transient-mark-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(calendar-week-start-day 0)
 '(case-fold-search t)
 '(magit-use-overlays nil)
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/Dropbox/Documents/org/work.org")))
 '(org-agenda-show-all-dates t)
 '(org-tags-column -78)
 '(package-selected-packages
   (quote
    (undo-tree monokai-theme magit jinja2-mode iedit helm git-gutter-fringe fill-column-indicator elpy autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
