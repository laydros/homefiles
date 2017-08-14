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
(add-to-list 'load-path "/usr/share/emacs25/site-lisp/mu4e")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)

;; path to Maildir
(setq mu4e-maildir "/home/laydros/var/mail")

;; should mu4e use fancy utf characters
(setq mu4e-use-fancy-chars 't)

;; by default mu4e does not rename files when moving them and this upsets
;; mbsync.
(setq mu4e-change-filenames-when-moving t)

;; give me ISO(ish) format date-time stamps in the header list
(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

;; customize reply-quote-string
;; M-x find-function RET message-citation-line-format for docs
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M %Z:\n")
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)

;; fastmail and gmail automatically add sent messages, turn off saving
(setq mu4e-sent-messages-behavior 'delete)

;; I want my format=flowed thank you very much
;; mu4e sets up visual-line-mode and also fill (M-q) to do the right thing
;; each paragraph is a single long line; at sending, emacs will add the
;; special line continuation characters.
(setq mu4e-compose-format-flowed t)

;; every new email composition gets its own frame! (window)
(setq mu4e-compose-in-new-frame t)

;; without this, "symbol's value as variable is void: mml2014-use" when signing
;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
;; so set to epg and all was good!
;; to sign a mail: M-x mml-secure-sign-pgpmime
;; (setq mml2015-use 'epg)

;; the next are relative to `mu4e-maildir'
;; instead of strings, they can be functions too, see
;; their docstring or the chapter 'Dynamic folders'
(setq mu4e-sent-folder   "/fastmail/Sent Items"
      mu4e-drafts-folder "/fastmail/Drafts"
      mu4e-trash-folder  "/fastmail/Trash")

;; the maildirs you use frequently; access them with 'j' ('jump')
(setq   mu4e-maildir-shortcuts
    '(("/factor500/inbox"     . ?f)
      ("/fastmail/INBOX"       . ?i)
      ("/wycom/inbox"        . ?w)
      ("/fastmail/bacon"        . ?b)))

;; list of my email addresses.
(setq mu4e-user-mail-address-list '("jwh@laydros.net"
                                    "laydros@gmail.com"
                                    "jhamilton@fastmail.us"
                                    "jasonh@factor500.com"
                                    "jasonh@wycomsystems.com"))


;; when you want to use some external command for html->text
;; conversion, e.g. the 'html2text' program
;; (cpbotha: html2text sees to work better than the built-in one)
;; (setq mu4e-html2text-command "html2text")

;; mu4e-action-view-in-browser is built into mu4e
;; by adding it to these lists of custom actions
;; it can be invoked by first pressing a, then selecting
(add-to-list 'mu4e-headers-actions
             '("in browser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions
             '("in browser" . mu4e-action-view-in-browser) t)


;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
;; These are the defaults:
(setq mu4e-headers-fields
    '( (:date          .  15)
       (:flags         .   5)
       (:from          .  22)
       (:subject       .  nil)))

;; program to get mail; alternatives are 'fetchmail', 'getmail'
;; isync or your own shellscript. called when 'U' is pressed in
;; main view.

;; If you get your mail without an explicit command,
;; use "true" for the command (this is the default)
(setq mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval 300)   ;; update every 5 minutes


;; setup default identity here:
;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq user-mail-address "jwh@laydros.net"
      user-full-name  "Jason W. Hamilton")

;; set this to nil so signature is not included by default
;; you can include in message with C-c C-w
;; (setq mu4e-compose-signature-auto-include 't)
;; (setq mu4e-compose-signature (with-temp-buffer
;;                                (insert-file-contents "~/.signature.personal")
;;                                (buffer-string)))
;; ;; message-signature-file NOT used by mu4e
;; (setq message-signature-file "~/.signature.personal")

;; many recipes online use an alist with the different email identities
;; I like to use these functions, because then I have more flexibility
(defun jwh-mu4e-personal()
  (interactive)
  (message "personal mail account")
  (setq  user-mail-address "jwh@laydros.net"
         mu4e-compose-signature (get-string-from-file "~/.signature.personal"))
  )

(defun jwh-mu4e-gmail()
  (interactive)
  (message "gmail account")
  (setq  user-mail-address "laydros@gmail.com"
         mu4e-compose-signature (get-string-from-file "~/.signature.gmail"))
)

(defun jwh-mu4e-factor500()
  (interactive)
  (message "factor500 mail account")
  (setq  user-mail-address "jasonh@factor500.com"
         mu4e-compose-signature (get-string-from-file "~/.signature.factor500"))
  )

(defun jwh-mu4e-wycom()
  (interactive)
  (message "wycom mail account")
  (setq  user-mail-address "jasonh@wycomsystems.com"
         mu4e-compose-signature (get-string-from-file "~/.signature.wycom"))
  )

;; quickly change account. got his idea from:
;; https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-mu4e.el
(define-key mu4e-main-mode-map (kbd "<f1>") 'jwh-mu4e-personal)
(define-key mu4e-main-mode-map (kbd "<f2>") 'jwh-mu4e-gmail)
(define-key mu4e-main-mode-map (kbd "<f4>") 'jwh-mu4e-factor500)
(define-key mu4e-main-mode-map (kbd "<f6>") 'jwh-mu4e-wycom)
(define-key mu4e-headers-mode-map (kbd "<f1>") 'jwh-mu4e-personal)
(define-key mu4e-headers-mode-map (kbd "<f2>") 'jwh-mu4e-gmail)
(define-key mu4e-headers-mode-map (kbd "<f4>") 'jwh-mu4e-factor500)
(define-key mu4e-headers-mode-map (kbd "<f6>") 'jwh-mu4e-wycom)


;; for sendmail read this http://www.gnus.org/manual/message_36.html
;; am using nullmailer, so my mail sending just became STUPID fast
;; (setq message-send-mail-function 'message-send-mail-with-sendmail)

;; smtp mail setting - if you DON'T want to use nullmailer, instead
;; connecting to your smtp server and waiting...
;; (setq
;;    message-send-mail-function 'smtpmail-send-it
;;    smtpmail-stream-type 'starttls
;;    smtpmail-default-smtp-server "mymailserver.com"
;;    smtpmail-smtp-server "mymailserver.com"
;;    smtpmail-smtp-service 587

;;    ;; if you need offline mode, set these -- and create the queue dir
;;    ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Maildir/queue
;;    smtpmail-queue-mail  nil
;;    smtpmail-queue-dir  "/home/user/Maildir/queue/cur")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; attachments go here
(setq mu4e-attachment-dir  "~/dl")

;; when you reply to a message, use the identity that the mail was sent to
;; the cpbotha variation -- function that checks to, cc and bcc fields
(defun jwh-mu4e-is-message-to (msg rx)
  "Check if to, cc or bcc field in MSG has any address in RX."
  (or (mu4e-message-contact-field-matches msg :to rx)
      (mu4e-message-contact-field-matches msg :cc rx)
      (mu4e-message-contact-field-matches msg :bcc rx)))

;; we only do something if we recognize something (i.e. no stupid default)
(add-hook 'mu4e-compose-pre-hook
          (defun my-set-from-address ()
            "Set current identity based on to, cc, bcc of original."
            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
              (if msg
                  (cond
                   ((jwh-mu4e-is-message-to msg (list "jwh@laydros.net"
                                                      "info@charlbotha.com"))
                    (jwh-mu4e-personal))
                   ((jwh-mu4e-is-message-to msg (list "laydros@gmail.com"
                                                      "charl@stonethree.com"))
                    (jwh-mu4e-gmail))
                   ((jwh-mu4e-is-message-to msg "jasonh@factor500.com")
                    (jwh-mu4e-factor500))
                   ((jwh-mu4e-is-message-to msg "jasonh@wycomsystems.com")
                    (jwh-mu4e-wycom)))))))

;; convenience function for starting the whole mu4e in its own frame
;; posted by the author of mu4e on the mailing list
(defun mu4e-in-new-frame ()
  "Start mu4e in new frame."
  (interactive)
  (select-frame (make-frame))
  (mu4e))

(provide 'laydros-mu4e)
