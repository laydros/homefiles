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
 '(org-agenda-files (quote ("~/Dropbox/Documents/org/notes.org"
                            "/home/laydros/Dropbox/Documents/org/personal.org"
                            "/home/laydros/Dropbox/Documents/org/work.org")))
 '(org-agenda-show-all-dates t)
 '(org-tags-column -78))

;; startup
(find-file "~/Dropbox/Documents/org/organizer.org")
(org-agenda nil "a")
(require 'org-contacts)

(setq org-agenda-include-diary t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; **************************************
;; * Key bindings
;; **************************************
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; setting up C-cr for capture, which Sacha Chua uses bc old remember-mode
(define-key global-map "\C-cr" 'org-capture)
(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; *****************************************
;; * File settings
;; *****************************************
(setq org-directory "/home/laydros/Dropbox/Documents/org")
(setq org-default-notes-file (concat org-directory "/organizer.org"))

;; **************************************************************
;; * TODO states - can be multiple flows, but won't for now
;;      statuses after pipe are done statuses.
;; **************************************************************
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "WAITING" "APPT" "|" "DONE" "DELEGATED")))

(setq org-use-fast-todo-selection t)

;; log when marked done
(setq org-log-done 'time)

;; to make org mode ask for note when set done
;; (setq org-log-done 'note)

;; templates
(defvar laydros/org-basic-task-template "* TODO %^{Task}
SCHEDULED: %^t
%?
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
;; :QUANTIFIED: %^{Quantified Awesome category}
:END:" "Basic task data")
(setq org-capture-templates
      `(("t" "Tasks-remember" entry
         (file+headline "~/Dropbox/Documents/org/organizer.org" "Tasks")
         ,laydros/org-basic-task-template)
        ("dt" "Done - task" entry
         (file+headline "~/Dropbox/Documents/org/organizer.org" "Tasks")
         "* DONE %^{Task}\nSCHEDULED: %^t\n%?")
        ("a" "Appointment" entry
         (file+headline "~/Dropbox/Documents/org/organizer.org" "Calendar")
         "* APPT %^{Entry}\nSCHEDULED: %^t\n%?")
        ("q" "Quick note" item
         (file+headline "~/Dropbox/Documents/org/organizer.org" "Quick notes"))
        ("c" "Contact" entry (file "~/Dropbox/Documents/org/contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")
        ("n" "Daily note" table-line (file+olp "~/Dropbox/Documents/org/organizer.org" "Daily notes")
         "| %u | %^{Note} |"
         :immediate-finish)
        ("r" "Notes" entry
         (file+datatree "~/Dropbox/Documents/org/organizer.org")
         "* %?\n\n%i\n"
        )))
        

(provide 'laydros-org)
;;; laydros-org.el ends here
