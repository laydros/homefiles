;;; laydros-erc.el ___

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

(require 'erc)

(require 'easymenu)
(easy-menu-add-item  nil '("tools")
                     ["IRC with ERC" erc t])

(defmacro jwh-erc-bouncer-connect (command server port nick ssl pass)
  "Create interactive command `command', for connecting to an IRC server. The
   command uses interactive mode if passed an argument."
  (fset command
        `(lambda (arg)
           (interactive "p")
           (if (not (= 1 arg))
               (call-interactively 'erc)
             (let ((erc-connect-function ',(if ssl
                                               'erc-open-ssl-stream
                                             'open-network-stream)))
               (erc :server ,server :port ,port :nick ,nick :password ,pass))))))

;; ssl connection:
(jwh-erc-bouncer-connect erc-znc "laydros.net" 6663 "laydros" t nil)

;; I'm using znc with ssl enabled, so some setup for that
(require 'tls)





(provide 'laydros-erc)
