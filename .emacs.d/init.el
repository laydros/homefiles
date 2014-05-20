
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(require 'json)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("Tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;Initialize package mode along with all the installed packages
(package-initialize)

(defun jwh-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))


;; (setq jwh-required-packages
;;       (list 'undo-tree 'magit 'gh 'monokai-theme 'elpy 'bar-cursor 'back-button 'auto-complete))
;; (dolist (package jwh-required-packages)
;;   (when (not (package-installed-p package))
;;     (package-refresh-contents)
;;     (package-install package))))

;; (setq jwh-init-dir (expand-file-name "init.d"))


(jwh-require-package 'monokai-theme)
(load-theme 'monokai t)

;; load all lisp files in ./init.d
;; (if (file-exists-p jwh-init-dir)
;;     (dolist (file (directory-files jwh-init-dir t "\\.el$"))
;;       (load-file)))


(setq visible-bell t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(display-time-mode 1)
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq scroll-step 1)

(setq transient-mark-mode t) ; visually show region
(setq global-font-lock-mode 1) ; everything should use fonts

(jwh-require-package 'elpy)
(jwh-require-package 'flymake-cursor)
(jwh-require-package 'magit)

(elpy-enable)
(elpy-clean-modeline)
;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

(highlight-indentation-mode -1)

;(require 'bbdb)

(line-number-mode t)
(column-number-mode t)

(setq-default fill-column 79)

(show-paren-mode t)
(jwh-require-package 'autopair)
(require 'autopair)

(jwh-require-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;(require 'bar-cursor)
;(bar-cursor-mode t)

(jwh-require-package 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

(jwh-require-package 'back-button)
(require 'back-button)
(back-button-mode 1)

;; resize window
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)

;; sample function
;; interactive makes it a command that can be run
;(defun display-buffer-name ()
;  (interactive)
;  (message (buffer-file-name)))
;(global-set-key (kbd "<f7>") 'display-buffer-name)
;; same thing inline
(global-set-key (kbd "<f8>") (lambda () (interactive) (message (buffer-file-name))))

(jwh-require-package 'markdown-mode)
(require 'markdown-mode)
;; only in markdown mode, f9 will spell check
(define-key markdown-mode-map (kbd "<f9>") 'ispell-buffer)
(add-hook 'markdown-mode-hook 'flyspell-mode)

(define-key elpy-mode-map (kbd "<f5>") 'flymake-display-err-menu-for-current-line)

;; C-h f - get function help
;; C-h v - get variable help

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


;; -------- things i might want ---------
;; typing when mark is active will delete highlighted
; (delete-selection-mode t)
;; common highlighting keystrokes
;; mix emacs and x keyboard (i don't seem to need this)
; (setq x-select-enable-clipboard t)

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

;; ----------------------------------
;; ---------- Key Bindings ----------
;; ----------------------------------

(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-r" 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)

;; ----------------------------------
;; ------------ Org-mode ------------
;; ----------------------------------

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(setq org-agenda-files (list "~/Dropbox/org-mode/personal.org"))


;; Ido mode provides a nice way to navigate the filesystem. This is mostly just turning it on.
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; makes temporary files go away
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; track recently-opened files
(recentf-mode 1)
(setq recentf-max-menu-items 100)

;; uniquify for buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ----------------------------------
;; -              UTF-8             -
;; ----------------------------------

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(defun insertdate ()
  "Spit out the current time"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(global-set-key [(f5)] 'insertdate)


;; (defun jonnay-sign ()                                        ;;
;;   "spit out my name, email and the current time"             ;;
;;   (interactive)                                              ;;
;;   (insert "-- Jonathan Arkell (jonathana@criticalmass.com)") ;;
;;   (jonnay-timestamp))                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; never quit accidentally
(setq confirm-kill-emacs 'yes-or-no-p)

;; load images as images
(auto-image-file-mode 1)

;; Recent files
(recentf-mode 1)

;; yank at point
(setq mouse-yank-at-point t)

(setq kill-whole-line t)

(setq user-mail-address "jwh@laydros.net")

(setq display-time-mode t)

;;;;;;;;;;;;;
;; ERC stuff
;;;;;;;;;;;;
;(setq erc-fill-function 'erc-fill-static)
;(setq erc-fill-static-center 22)

;(erc :server "irc.freenode.net" :port 6667 :nick "laydros")

;(add-hook 'erc-after-connect '(lambda ("freenode.net")
;               (erc-message "PRIVMSG" "NickServ identify mypassword")))

;; (setq erc-autojoin-channels-alist
;;   '(("freenode.net" "#emacs" "#cm6-snap" "#nethack")))

;(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;;;;;;;;;;;;;;;;;;;
;; Beautify JSON ;;
;;;;;;;;;;;;;;;;;;;

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))

;;;;;;;;;
;; SQL ;;
;;;;;;;;;
(set 'sql-ms-program "sqsh")
(set 'sql-sybase-program "sqsh")

;; Enable Markdown mode and setup additional file extensions.
;; Use pandoc to generate HTML previews from within the mode.
;; Use a custom css file to make it a little prettier.

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode t)))
;(setq markdown-command "pandoc --smart -f markdown -t html")
;(setq markdown-css-path (expand-file-name "markdown.css" abedra/vendor-dir))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
