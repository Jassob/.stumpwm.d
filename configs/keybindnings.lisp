(in-package :stumpwm)

;; Read some doc
(define-key *root-map* (kbd "d") "exec evince")

;; Browse somewhere
(define-key *root-map* (kbd "b") "colon1 exec conkeror http://www.")

;; Start or switch to firefox
(define-key *root-map* (kbd "C-f") "firefox")

;; Start or switch to spotify
(define-key *root-map* (kbd "C-s") "spotify")

;; Ssh somewhere
(define-key *root-map* (kbd "C-S") "colon1 exec urxvt -e ssh ")

;; Lock screen
(define-key *root-map* (kbd "C-l") "exec xlock -mode rain")

;; Start emacsclient instead of emacs
(define-key *root-map* (kbd "e") "emacs")
(define-key *root-map* (kbd "C-e") "exec emacsclient -c")

;; Override the xterm short keys
(define-key *root-map* (kbd "C-c") "urxvt")
(define-key *root-map* (kbd "c") "exec urxvt")

;; Run dmenu on C-z C-d
(define-key *root-map* (kbd "C-d") "exec dmenu_run")

;; Screenshot
(define-key *root-map* (kbd "C-p")
  "screenshot")
(define-key *root-map* (kbd "M-p")
  "part-screenshot")

;; Print battery status
(define-key *root-map* (kbd "C-b") "show-battery")

;; Toggle touchpad
(define-key *root-map* (kbd "C-m") "toggle-touchpad")
