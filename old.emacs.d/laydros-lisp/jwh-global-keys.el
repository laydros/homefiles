;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

; don't ask which buffer to kill (from graphine)
(global-set-key (kbd "C-x k") 'kill-default-buffer)

; kill the default buffer and close its window (from graphine)
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)


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


(provide 'jwh-global-keys)
