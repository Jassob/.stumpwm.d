;; -*-lisp-*-/
;;
;; Here is a sample .stumpwmrc file

(in-package :stumpwm)

;; change the prefix key to something else
(set-prefix-key (kbd "C-z"))

(redirect-all-output (data-dir-file "debug-output" "txt"))

(defvar *user-stumpwm-directory* "~/.stumpwm.d/")
(defvar *user-stumpwm-config-directory* (concat *user-stumpwm-directory* "configs/"))

;; Browser of choice
(defvar *www-browser* "conkeror")
(defvar *x-terminal*  "urxvt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User-defined commands now live in:
;;   *user-stumpwm-config-directory*/commands.lisp
(load (concat *user-stumpwm-config-directory* "commands.lisp"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load extra config files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load Multimedia keys
(load (concat *user-stumpwm-config-directory* "multimedia-keys.lisp"))
;; Keybindings
(load (concat *user-stumpwm-config-directory* "keybindnings.lisp"))
;; Load Emacs setup
(load (concat *user-stumpwm-config-directory* "emacs.lisp"))
;; Load appearance (such as fonts, mode-line and so on)
(load (concat *user-stumpwm-config-directory* "appearance.lisp"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start background programs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(run-shell-command "redshift")
(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "feh --bg-center $HOME/Pictures/numix_blue_tardis.png")
(run-shell-command "emacs --daemon")
(run-shell-command "dropbox-cli start")
(run-shell-command "twmnd")

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

;; Load temporary hacks
(load "~/.stumpwm.d/configs/hacks.lisp")
