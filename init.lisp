;; -*-lisp-*-/
;;
;; Here is a sample .stumpwmrc file

(in-package :stumpwm)

;; change the prefix key to something else
(set-prefix-key (kbd "C-z"))

;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; launch or raise web browser
(defcommand firefox () ()
            "Start Firefox or switch to it, if it is already running."
            (run-or-raise "firefox" '(:class "Firefox")))

;; launch or raise spotify
(defcommand spotify () ()
            "Start Spotify or switch to it, if it already running."
            (run-or-raise "spotify" '(:class "Spotify")))


;; Load extra config files
; Load Battery
(load "/home/jassob/.stumpwm.d/plugins/battery.lisp")
; Load Multimedia keys 
(load "/home/jassob/.stumpwm.d/plugins/multimedia-keys.lisp")
; Load Emacs setup
(load "/home/jassob/.stumpwm.d/plugins/emacs.lisp")

;; Start background programs
;Start x-f.lux
(stumpwm:run-shell-command "redshift")
; Make the cursor an ordinary left pointer instead of a cross
(stumpwm:run-shell-command "xsetroot -cursor_name left_ptr")
; Set a beautiful background
(stumpwm:run-shell-command "feh --bg-center $HOME/Pictures/numix_blue_tardis.png")
; Load the fancy keyboard layout
(stumpwm:run-shell-command "$HOME/.local/bin/fix-keyboard")
; Start Emacs
(stumpwm:run-shell-command "emacs --daemon")
; Start dropbox
(stumpwm:run-shell-command "dropbox-cli start")

;; Keybindings
; Read some doc
(define-key *root-map* (kbd "d") "exec evince")
; Browse somewhere
(define-key *root-map* (kbd "b") "colon1 exec conkeror http://www.")
; Start or switch to firefox
(define-key *root-map* (kbd "C-f") "firefox")
; Start or switch to spotify
(define-key *root-map* (kbd "C-s") "spotify")
; Ssh somewhere
(define-key *root-map* (kbd "C-S") "colon1 exec urxvt -e ssh ")
; Lock screen
(define-key *root-map* (kbd "C-l") "exec xlock")
;; Start emacsclient instead of emacs
(define-key *root-map* (kbd "e") "exec emacsclient -c")
(define-key *root-map* (kbd "C-e") "exec emacsclient -c")
; Override the xterm short keys
(define-key *root-map* (kbd "C-c") "exec urxvt")
(define-key *root-map* (kbd "c") "exec urxvt")
; Run dmenu on C-z C-d
(define-key *root-map* (kbd "C-d") "exec dmenu_run")

(define-key *root-map* (kbd "C-p")
  "exec import -window root png:$HOME/Desktop/screenshot_$(date +%F_%H-%M-%S).png")

;; Message window font
(set-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-15")

;;; Define window placement policy...

;; Clear rules
(clear-window-placement-rules)

;; Last rule to match takes precedence!
;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
;; match is performed.
;; TIP: if the :create flag is set then a missing group will be created and
;; restored from *data-dir*/create file.
;; TIP: if the :restore flag is set then group dump is restored even for an
;; existing group using *data-dir*/restore file.
(define-frame-preference "Default"
  ;; frame raise lock (lock AND raise == jumpto)
  (0 t nil :class "Konqueror" :role "...konqueror-mainwindow")
  (1 t nil :class "XTerm"))

(define-frame-preference "Ardour"
  (0 t   t   :instance "ardour_editor" :type :normal)
  (0 t   t   :title "Ardour - Session Control")
  (0 nil nil :class "XTerm")
  (1 t   nil :type :normal)
  (1 t   t   :instance "ardour_mixer")
  (2 t   t   :instance "jvmetro")
  (1 t   t   :instance "qjackctl")
  (3 t   t   :instance "qjackctl" :role "qjackctlMainForm"))

(define-frame-preference "Shareland"
  (0 t   nil :class "XTerm")
  (1 nil t   :class "aMule"))

(define-frame-preference "Emacs"
  (1 t t :restore "emacs-editing-dump" :title "...xdvi")
  (0 t t :create "emacs-dump" :class "Emacs"))
