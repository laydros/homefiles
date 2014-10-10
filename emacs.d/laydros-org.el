;;; laydros-org.el ___

;; Author: Jason Hamilton
;; Keywords:

;; Keywords:
 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
 
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.
 
;;; Commentary:
 
;;
 
;;; Code:

(custom-set-variables
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(calendar-week-start-day 0)
 '(case-fold-search t)
 '(make-backup-files nil)
 '(org-agenda-files (quote ("/home/laydros/Dropbox/Documents/org/personal.org"
                            "/home/laydros/Dropbox/Documents/org/work.org")))
 '(org-agenda-show-all-dates t)
 '(org-tags-column -78))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "/home/laydros/Dropbox/Documents/org")

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; **************************************************************
;; * TODO states - can be multiple flows, but won't for now
;;      statuses after pipe are done statuses.
;; **************************************************************
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "WAITING" "|" "DONE" "DELEGATED")))

;; log when marked done
(setq org-log-done 'time)

;; to make org mode ask for note when set done
;; (setq org-log-done 'note)

(provide 'laydros-org)
;;; laydros-org.el ends here
