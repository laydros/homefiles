
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(require 'json)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives '("Tromey" . "http://tromey.com/elpa/") t)
;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;Initialize package mode along with all the installed packages
(package-initialize)
;(package-refresh-contents)

;; (defvar jwh-local-packages '(projectile auto-complete epc jedi))

(defun jwh-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    projectile
;; ------------------------
;; C-c p s - switch to a project
;; C-c p f - list files in a project
;; C-c p k - kill all buffers for a project
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(jwh-require-package 'projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'ido)

;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;
(jwh-require-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; show menu very quickly - may need to turn back off
(setq ac-show-menu-immediately-on-auto-complete t)

;; EPC - hooks together jedi and emacs
(jwh-require-package 'epc)

;;;;;;;;;;;;;
;; jedi
;; ---------------
;; current setup is for python, similar setup could be used with:
;; robe - ruby
;; irony-mode - C/C++
;; gocode - goloan
;; CEDET - various
;;     - jwh 2014-05-20
;;;;;;;;;;;;;
(jwh-require-package 'jedi)
(require 'jedi)
;; Hook up autocomplete
(add-to-list 'ac-sources 'ac-source-jedi-direct)
;; Enable for python-mode
(add-hook 'python-mode-hook 'jedi:setup)
(defvar jedi-config:use-system-python nil
  "Will use system python and active environment for Jedi server.
May be necessary for some GUI environments (e.g., Mac OS X)")
(defvar jedi-config:with-virtualenv nil
  "Set to non-nil to point to a particular virtualenv.")
;; Variables to help jedi find project root
(defvar jedi-config:vcs-root-sentinel ".git")
(defvar jedi-config:python-module-sentinel "__init__.py")

;; Helper functions

;; Small helper to scrape text from shell output
(defun get-shell-output (cmd)
  (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string cmd)))

;; Function to find the project root given a buffer
(defun get-project-root (buf repo-type init-file)
  (vc-find-root (expand-file-name (buffer-file-name buf)) repo-type))

(defvar jedi-config:find-root-function 'get-project-root)

;; And call this on initialization
(defun current-buffer-project-root ()
  (funcall jedi-config:find-root-function
           (current-buffer)
           jedi-config:vcs-root-sentinel
           jedi-config:python-module-sentinel))

(defun jedi-config:setup-server-args ()
  ;; little helper macro for building the arglist
  (defmacro add-args (arg-list arg-name arg-value)
    `(setq ,arg-list (append ,arg-list (list ,arg-name ,arg-value))))
  ;; and now define the args
  (let ((project-root (current-buffer-project-root)))
    ;; variable for this buffer only
    (make-local-variable 'jedi:server-args)

    ;; And set our variables
    (when project-root
      (add-args jedi:server-args "--sys-path" project-root))
    (when jedi-config:with-virtualenv
      (add-args jedi:server-args "--virtual-env"
                jedi-config:with-virtualenv))))

(add-hook 'python-mode-hook
          'jedi-config:setup-server-args)

;; this would be needed for OS X
;; (when jedi-config:use-system-python
;;   (add-hook 'python-mode-hook
;;             'jedi-config:set-python-executable))

;; Jedi custom keybindings
;; --------------------------------------------------------
;; description                             | default | new
;; go to def of symbol at point            | C-c .   | M-.
;; go to previous location of point        | C-c ,   | M-,
;; show docstring for symbol at point      | C-c ?   | M-?
;; pop up signature for function at point  | None    | M-/
(defun jedi-config:setup-keys ()
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-/") 'jedi:get-in-function-call))

;; Don't let tooltip show up automatically
(setq jedi:get-in-function-call-delay 10000000)
;; Start completion at method dot
(setq jedi:complete-on-dot t)
;; Use custom keybinds
(add-hook 'python-mode-hook 'jedi-config:setup-keys)

;;;;;;;;;;;;;;;;;;;;;
;; end jedi config ;;
;;;;;;;;;;;;;;;;;;;;;


(jwh-require-package 'monokai-theme)
(load-theme 'monokai t)

(setq visible-bell t)

(blink-cursor-mode 0)
(display-time-mode 1)
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq scroll-step 1)

(setq transient-mark-mode t) ; visually show region
(setq global-font-lock-mode 1) ; everything should use fonts

;(jwh-require-package 'ipython)

(jwh-require-package 'elpy)
(jwh-require-package 'flymake-cursor)
(jwh-require-package 'magit)

;;(elpy-enable)
;;(elpy-clean-modeline)
;; Fixing a key binding bug in elpy
;(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)
(global-unset-key (kbd "C-;"))

(defun python--add-debug-highlight ()
  "Adds a highlighter for use by `python--ipdb-breakpoint-string'"
  (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))

(add-hook 'python-mode-hook 'python--add-debug-highlight)

(defvar python--ipdb-breakpoint-string "import ipdb; ipdb.set_trace() ## DEBUG ##"
  "Python breakpoint string used by `python-insert-breakpoint'")

;; (defun python-insert-breakpoint ()
;;   "Inserts a python breakpoint using `pdb'"
;;   (interactive)
;;   (back-to-indentation)
;;   ;; this preserves the correct indentation in case the line above
;;   ;; point is a nested block
;;   (split-line)
;;   (insert python--ipdb-breakpoint-string))
;(define-key python-mode-map (kbd "<f6>") 'python-insert-breakpoint)


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

;;(jwh-require-package 'undo-tree)
;;(require 'undo-tree)
;;(global-undo-tree-mode)

;(jwh-require-package 'back-button)
;(require 'back-button)
;(back-button-mode 1)

(jwh-require-package 'fill-column-indicator)
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(jwh-require-package 'popwin)
(require 'popwin)
(popwin-mode 1)

(highlight-indentation-mode -1)

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

;(define-key elpy-mode-map (kbd "<f5>") 'flymake-display-err-menu-for-current-line)

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
      '((sequence "TODO" "INPROGRESS" "WAITING" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(setq org-agenda-files (list "~/Dropbox/org-mode/personal.org"))


;; Ido mode provides a nice way to navigate the filesystem. This is mostly just turning it on.
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(jwh-require-package 'ido-vertical-mode)
(ido-vertical-mode t)

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

(global-linum-mode 1)


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
; (set 'sql-ms-program "sqsh")
; (set 'sql-sybase-program "sqsh")

;; Enable Markdown mode and setup additional file extensions.
;; Use pandoc to generate HTML previews from within the mode.
;; Use a custom css file to make it a little prettier.

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode t)))
;(setq markdown-command "pandoc --smart -f markdown -t html")
;(setq markdown-css-path (expand-file-name "markdown.css" abedra/vendor-dir))

(defun totd ()
  (interactive)
  (random t) ;; seed with time-of-day
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\\n"
               "========================\\n\\n"
               (describe-function command)
               "\\n\\nInvoke with:\\n\\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(when (require 'em-term)
  (dolist (i '("kop" "ledger" "mc" "htop"))
    (add-to-list 'eshell-visual-commands i)))


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
