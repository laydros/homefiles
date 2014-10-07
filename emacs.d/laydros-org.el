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
 '(calendar-week-start-day 1)
 '(case-fold-search t)
 '(make-backup-files nil)
 '(org-agenda-files (quote ("/home/laydros/Documents/org/personal.org"
                            "/home/laydros/Documents/org/work.org")))
 '(org-agenda-show-all-dates t)
 '(org-tags-column -78))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ; not needed since 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed with global-font-lock
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "/home/laydros/Dropbox/Documents/org-mode")


(provide 'laydros-org)
;;; laydros-org.el ends here
