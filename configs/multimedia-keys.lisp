;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Joel Agnel Fernandes
;; initramd@gmail.com
;;
;; Description: Multimedia key mappings for stumpwm
;; suggestions/patches welcomed
;;
;; Usage: Simply load this file and go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :stumpwm)

;; KEY DEFINITION - Key code symbol table
;; note: certain keyboards have this different. use xev to find yours if these don't work.
;; This table gets used to register the multimedia keys in case they are not recognized by xmodmap.
(defvar *key-codes*
      '((162 . "XF86AudioPlay")		   ; handled by amarok (or other mp3 players)
	(164 . "XF86AudioStop")		   
	(144 . "XF86AudioPrev")
	(153 . "XF86AudioNext")
	(160 . "XF86AudioMute")
	(174 . "XF86AudioLowerVolume")	   ; we use amixer (alsa mixer) to  handle this
	(176 . "XF86AudioRaiseVolume")
        (233 . "XF86MonBrightnessUp")
        (232 . "XF86MonBrightnessDown")))

(defvar *mpris-destination* "org.mpris.MediaPlayer2.spotify")
(defvar *mpris-protocol*    "/org/mpris/MediaPlayer2")
(defvar *mpris-ns*          "org.mpris.MediaPlayer2.Player.")

;; Map keycodes to keysyms
(mapcar (lambda (pair)
	  (let* ((keycode (car pair))
		 (keysym  (cdr pair))
		 (format-dest nil)
		 (format-dest (make-array 5 :fill-pointer 0 :adjustable t :element-type 'character)))
	    (format format-dest "xmodmap -e 'keycode ~d = ~a'" keycode keysym)
	    (run-shell-command format-dest)
	  format-dest))
	*key-codes*)

;; Volume control
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioLowerVolume")
  "exec amixer set Master 5%-")
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioRaiseVolume")
  "exec amixer set Master 5%+")

;; Mute
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioMute")
  "exec amixer set Master toggle")

;; Backlight control
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86MonBrightnessUp")
  "exec xbacklight -inc 5")
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86MonBrightnessDown")
  "exec xbacklight -dec 5")

;; Send commands to spotify process
(defun send-to-spotify (command)
  "Send command to Spotify process via MPRIS"
  (concat "exec dbus-send "
          "--print-reply "
          "--dest="
          *mpris-destination*
          " "
          *mpris-protocol*
          " "
          *mpris-ns*
          command))

;; Play or pause spotify music
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioPlay")
  (send-to-spotify "PlayPause"))

;; Play next song in spotify
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioNext")
  (send-to-spotify "Next"))

;; Play next song in spotify
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioPrev")
  (send-to-spotify "Previous"))

