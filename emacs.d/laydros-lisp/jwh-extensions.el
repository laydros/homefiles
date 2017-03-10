;; jwh-extensions.el
;; pulling out packages into seperate file, using use-package,
;; and copying much config from emacs-bootstrap

;; jwh - TODO - some of the stuff from my old config I might want
;; that was not in emacs-bootstrap
;; (when (window-system)
;;   (require-soft 'git-gutter-fringe
;;                 (global-git-gutter-mode +1)
;;                 (setq-default indicate-buffer-boundaries 'left)
;;                 (setq-default indicate-empty-lines +1)))

;; (require-soft 'jinja2-mode
;;               (setq-default sgml-basic-offset 4))

(use-package ace-jump-mode
  :bind
  ("C-c SPC" . ace-jump-mode))

;; jwh - TODO - I used to use autopair
(use-package autopair)

;; jwh 2015-07-10 - old company mode config incase I want anything back
;; tooltip-flip-when-above will invert if the completion popup-isearch-match
;; is displayed on top (happens near the bottom of the windows)
;; (jwh-add-missing-package 'company)
;; (require-soft 'company
;;               (setq company-tooltip-flip-when-above 1)
;;               (setq company-idle-delay 0.3)
;;               (setq company-minimum-prefix-length 2)
;;               (global-company-mode 1))
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package flycheck)

;; old helm config in case I want anything from it
;; (require-soft 'helm
;;               (eval-after-load 'company
;;                 '(progn
;;                    (define-key company-mode-map (kbd "C-:") 'helm-company)
;;                    (define-key company-active-map (kbd "C-:") 'helm-company)))
;;               (define-key helm-map (kbd "C-z") 'helm-select-action)
;;               (setq helm-ff-file-name-history-use-recentf t))

(use-package helm
  :init
  (require 'helm-config)
  :config
  (setq helm-split-window-in-side-p t
        helm-split-window-default-side 'below
	helm-idle-delay 0.0
	helm-input-idle-delay 0.01
	helm-quick-update t
	helm-ff-skip-boring-files t)
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x v" . helm-projectile)
         ("C-x c o" . helm-occur)
         ("C-x c p" . helm-projectile-ag)
         ("C-x c k" . helm-show-kill-ring)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)))

(use-package helm-ag)

(use-package helm-git-grep)

(use-package helm-projectile)

(use-package helm-swoop
  :bind
  ("C-x c s" . helm-swoop))

(use-package hlinum
  :config
  (hlinum-activate))

;; jwh - TODO - maybe something else is better now
(use-package iedit)

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package magit
  :config

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this))

(use-package neotree
  :config
  (setq neo-theme 'arrow
        neotree-smart-optn t
        neo-window-fixed-size nil)
  ;; Disable linum for neotree
  (add-hook 'neo-after-create-hook 'disable-neotree-hook))

(use-package org
  :config
  (setq org-directory "~/Dropbox/Documents/org"
        org-default-notes-file (concat org-directory "/todo.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile:per-repo)
  (setq org-projectile:per-repo-filename "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile:todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package page-break-lines)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (projectile-global-mode))

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))

(use-package smartparens)

(use-package smex)

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
  (global-undo-tree-mode 1))

;; uniquify to prevent buffer name conflict
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package which-key
  :config
  (which-key-mode))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package wgrep)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(provide 'jwh-extensions)
