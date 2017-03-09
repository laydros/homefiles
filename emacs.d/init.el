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

(setq c-default-style "linux"
          c-basic-offset 4)

;; require soft should let things happen in spite of missing packages
(defmacro require-soft (name &rest body)
  `(if (require ,name nil t)
       (progn ,@body)
     (message "Could not load \"%s\", skipping..." ,name)))


;; (when (memq window-system '(mac nc))
;;  (exec-path-from-shell-initialize))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defun jwh-add-missing-package (name)
  (unless (package-installed-p name)
    (package-install name)))



;; ************************************************************************
;; *  custom key mode
;; *  based on chris n.
;; ************************************************************************
;; (define-minor-mode jason2-keys-mode
;;   "Global minor mode for Jason's custom key bindings

;; This ensures no major mode overrides the keybindings, while still
;; making them easy to toggle. Also, all defined keybindings can be listed here:"
;;   :init-value t
;;   :keymap (make-sparse-keymap))

;; (defun jason2-define-key (key def)
;;   (define-key jason2-keys-mode-map (kbd key) def))

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

;; ************************************************************************
;; * - Elpy -
;; ************************************************************************
(jwh-add-missing-package 'elpy)
(require-soft 'elpy
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
(require-soft 'uniquify
              (setq uniquify-buffer-name-style 'forward))

;; function to hide ^M characters in mixed line ending files
(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; load images as images
(auto-image-file-mode 1)

(setq dired-auto-revert-buffer t)
(setq display-time-24hr-format t)

;; (setq 'select-active-regions nil)
;; (setq 'shift-select-mode nil)
;; (setq 'transient-mark-mode nil)


;; ************************************************************************
;; * - Key Bindings -
;; ************************************************************************

;; ;; buffer-menu stuff from chris n
;; (jason2-define-key "<f6>" 'buffer-menu)
;; ;;(jason2-define-key "<S-f6>" #'(lambda () (interactive) (dired "~")))

;; ;; Emacs21 changes these.
;; ;; 28aug2002  +chris+
;; (jason2-define-key "<home>" 'beginning-of-buffer)
;; (jason2-define-key "<end>" 'end-of-buffer)

;; ;; Make F12 work like 'M-x goto-line'
;; (jason2-define-key "<f12>" 'goto-line)

(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
;; (global-set-key (kbd "<f10>") 'magit-status)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-h i") 'helm-info)
(global-set-key (kbd "C-h b") 'helm-descbinds)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c C-r") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-S-r") 'revert-buffer)

;; jwh 2015-07-01 - function to add permanent macro
(defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro
     (name-last-kbd-macro name)            ; use this name for the macro
     (find-file user-init-file)            ; open ~/.emacs or other user init file
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer

;; ************************************************************************
;; * - External loads -
;; * stuff in external init files
;; ************************************************************************

;; mu4e config
(require 'laydros-mu4e)
;; load org-mode stuff
(require 'laydros-org)
;; load some custom functions
(require 'laydros-functions)
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
