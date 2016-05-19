(in-package :stumpwm)

;; Read some doc
(define-key *root-map* (kbd "d") "exec evince")

;; Browse somewhere
(define-key *root-map* (kbd "b") (concat "colon1 exec " *www-browser* " http://"))

;; Start or switch to firefox
(define-key *root-map* (kbd "C-f") "browser")

;; Keybindings to frequently used websites.
(define-key *top-map* (kbd "s-m") (concat "exec "
                                          *www-browser*
                                          " http://messenger.com"))

(define-key *top-map* (kbd "s-i") (concat "exec "
                                          *www-browser*
                                          " http://inbox.google.com"))

(define-key *top-map* (kbd "s-s") (concat "exec "
                                          *www-browser*
                                          " http://slack.com"))

(define-key *top-map* (kbd "s-c") (concat "exec "
                                          *www-browser*
                                          " http://calendar.google.com"))

(define-key *top-map* (kbd "s-t") (concat "exec "
                                          *www-browser*
                                          " http://toggl.com/app"))

(define-key *top-map* (kbd "s-g") "google")

;; Start or switch to spotify
(define-key *root-map* (kbd "C-s") "spotify")

;; Ssh somewhere
(define-key *root-map* (kbd "C-S") (concat "colon1 exec " *www-browser* " -e ssh "))

;; Lock screen
(define-key *root-map* (kbd "C-l") "exec xlock -mode rain")

;; Start emacsclient instead of emacs
(define-key *root-map* (kbd "e") "emacs")
(define-key *root-map* (kbd "C-e") "exec emacsclient -c")

;; Override the xterm short keys
(define-key *root-map* (kbd "c") "term")
(define-key *root-map* (kbd "C-c") (concat "exec " *x-terminal*))

;; Run dmenu on C-z C-d
(define-key *root-map* (kbd "C-d") "exec dmenu_run")

;; Screenshot
(define-key *root-map* (kbd "C-p")
  "screenshot")
(define-key *root-map* (kbd "M-p")
  "part-screenshot")

;; Print battery status
(define-key *root-map* (kbd "C-b") "show-battery")

;; Print master volume
(define-key *root-map* (kbd "C-v") "show-master-volume")

;; Toggle touchpad
(define-key *root-map* (kbd "C-m") "toggle-touchpad")
