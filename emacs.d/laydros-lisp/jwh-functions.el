;; Add your custom functions here

;; (defun something
;;    (do-something))

;; i find it hard to believe that this doesn't exist elsewhere, but this
;; little function is key to my emacs usage. it allows me to do smart
;; commenting and un-commenting pretty much anywhere
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


;; function to hide ^M characters in mixed line ending files
(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-function) (kill-buffer)))


(defun kill-buffer-if-file (buf)
  "Kill a buffer only if it is file-based."
  (when (buffer-file-name buf)
    (when (buffer-modified-p buf)
        (when (y-or-n-p (format "Buffer %s is modified - save it?" (buffer-name buf)))
            (save-some-buffers nil buf)))
    (set-buffer-modified-p nil)
    (kill-buffer buf)))


(defun kill-all-buffers ()
    "Kill all file-based buffers."
    (interactive)
    (mapc (lambda (buf) (kill-buffer-if-file buf))
     (buffer-list)))


(defun kill-buffer-and-window ()
  "Close the current window and kill the buffer it's visiting."
  (interactive)
  (progn
    (kill-buffer)
    (delete-window)))

(defun my-setup-indent (n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  (setq indent-tabs-mode t) ; use tab instead of space
  (my-setup-indent 4) ; indent 4 spaces width
  )

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  (setq indent-tabs-mode nil) ; use space instead of tab
  (my-setup-indent 4) ; indent 2 spaces width
  )

;; comment out for now. not quite sure what I had this for
;; (my-personal-code-style)


(provide 'jwh-functions)
