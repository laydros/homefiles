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

(my-personal-code-style)

(provide 'laydros-functions)
