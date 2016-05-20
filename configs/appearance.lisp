(in-package :stumpwm)

(defvar *user-stumpwm-contrib-directory*
      (concat *user-stumpwm-directory* "contrib/"))

;; Messages and input prompt to show up in center
(setf *message-window-gravity* :center)
(setf *input-window-gravity* :center)

;; Load the ttf-font module
(add-to-load-path (concat *user-stumpwm-contrib-directory* "util/ttf-fonts/"))
(load-module "ttf-fonts")

;; Use the ttf-font module to set the font
(set-font (make-instance 'xft:font
			 :family "Inconsolata"
			 :subfamily "Regular"
			 :size 10))

;;; ============================================================================
;;; Mode-line configuration
;;;
;;; This part is stolen from Bill Zimmerly
;;; Source: (https://gist.github.com/dbjergaard/8776184)
;;; ============================================================================

;; I thought that this mode-line was fabulous!
(defvar *battery-status-command*
  (concatenate 'string "acpi -b "
	       "| awk -F '[ ,]' '{printf \"%s%s\", $3, $5}' "
	       "| sed s/Discharging/\-/ | sed s/Unknown// "
	       "| sed s/Full// | sed s/Charging/+/"))

(defvar *vol-status-command*
  "pamixer --get-volume | awk -F '[\n]' '{printf \"%s\", $1}'")

;; Set up mode-line-format
(setf *screen-mode-line-format*
      (list "[^B%n^b] %W^> "
	    '(:eval (run-shell-command *battery-status-command* t))
	    " | Vol. "
	    ;;'(:eval (run-shell-command *vol-status-command* t))
	    "% | %d"))

(setf *mode-line-timeout* 1)

(toggle-mode-line (current-screen)
        (current-head))

(setf *window-format* "%m%n%s%c")

;;; Mode-line config ends here
