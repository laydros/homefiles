;; Install mu and mu4e from source. On Ubuntu, it goes like this:

;; sudo apt-get install libgmime-2.6-dev libxapian-dev
;; sudo apt-get install guile-2.0-dev html2text xdg-utils
;; git clone https://github.com/djcb/mu.git
;; cd mu
;; autoreconf -i && ./configure && make
;; sudo make install

;; This configuration supports multiple identities that can be activated by
;; either pressing a shortcut key in the main screen or headers, or when
;; you’re replying to an email that was sent to an email that’s associated
;; with one of your identities. Each identity is configured by a function that
;; you define. Here that includes the from address and the signature.

;; http://xahlee.blogspot.com/2010/09/elisp-read-file-content-in-one-shot.html
;; we'll use this to read your different signatures from files
(defun get-string-from-file (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;; this is where the install procedure above puts your mu4e
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)

;; path to Maildir
(setq mu4e-maildir "/home/laydros/Maildir")

;; should mu4e use fancy utf characters
;; (setq mu4e-use-fancy-chars 't)

;; give me ISO(ish) format date-time stamps in the header list
(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

;; customize reply-quote-string
;; M-x find-function RET message-citation-line-format for docs
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M %Z:\n")
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)


;; without this, "symbol's value as variable is void: mml2014-use" when signing
;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
;; so set to epg and all was good!
;; to sign a mail: M-x mml-secure-sign-pgpmime
;; (setq mml2015-use 'epg)

;; the next are relative to `mu4e-maildir'
;; instead of strings, they can be functions too, see
;; their docstring or the chapter 'Dynamic folders'
(setq mu4e-sent-folder   "/Archives.2014"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder  "/Trash")

;; the maildirs you use frequently; access them with 'j' ('jump')
(setq   mu4e-maildir-shortcuts
    '(("/Archives.2014"     . ?a)
      ("/INBOX"       . ?i)
      ("/Inbox-WORK"        . ?w)
      ("/Archives.2014"        . ?s)))

;; list of my email addresses.
(setq mu4e-user-mail-address-list '("info@charlbotha.com"
                                    "cpbotha@cpbotha.net"
                                    "cpbotha@vxlabs.com"
                                    "cpbotha@medvis.org"
                                    "charl@treparel.com"
                                    "charl.botha@treparel.com"))
