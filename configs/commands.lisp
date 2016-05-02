(in-package :stumpwm)

;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
(defcommand colon1 (&optional (initial "")) (:rest)
  """Interactively ask for a command and evaluates it"""
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

(defun cat (&rest strings)
  "A shortcut for (concatenate 'string foo bar)."
  (apply 'concatenate 'string strings))

(defcommand google (search)
  ((:string "Search in Google for: "))
  "docstring"
  (check-type search string)
  (run-shell-command (cat
		      "conkeror http://www.google.com/search?q="
		      (substitute #\+ #\Space search))))

(defcommand firefox () ()
  "Start Firefox or switch to it, if it is already running."
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand conkeror () ()
	    "Start Conkeror or switch to it, if it is already running."
	    (run-or-raise "conkeror" '(:class "Conkeror")))

(defcommand spotify () ()
  "Start Spotify or switch to it, if it already running."
  (run-or-raise "spotify" '(:class "Spotify")))

(defcommand emacs () ()
  "Start Emacsclient or switch to it, if it is already running."
  (run-or-raise "emacsclient" '(:class "Emacs")))

(defcommand urxvt () ()
  "Start an urxvt instance or switch to it, if it is already running."
  (run-or-raise "urxvt" '(:instance "urxvt")))

(defcommand screenshot () ()
  "Take a screenshot of the whole desktop."
  (run-shell-command "exec import -window root png:$HOME/Pictures/screenshots/screenshot_$(date +%F_%H-%M-%S).png"))

(defcommand part-screenshot () ()
  "Take a screenshot of only the active window."
  (run-shell-command "scrot -u -e 'mv $f ~/Pictures/screenshots/'"))

(defcommand show-battery () ()
  "Prints the current battery status, as showed by ACPI"
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand show-master-volume () ()
	    "Prints the current master volume."
	    (echo-string (current-screen)
			 (run-shell-command "pamixer --get-volume | awk -F '[\n]' '{printf \"%s\", $1}'" t)))

(defcommand toggle-touchpad () ()
  "Toggles the touchpad using synclient"
  (let
      ;; Stores the integer showing whether touchpad is off or not in touchpadOff
      ((touchpadOff (remove-if-not
                     #'digit-char-p
                     (run-shell-command "synclient | grep TouchpadOff" t))))
    ;; touchpadOff is either "0" or "1"
    (if (string= touchpadOff "0")
        (run-shell-command "synclient TouchpadOff=1") ;; turn off touchpad
        (run-shell-command "synclient TouchpadOff=0") ;; turn on touchpad
        ))
  )
