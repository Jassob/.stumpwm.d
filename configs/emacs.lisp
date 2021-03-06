;; Load swank.
;; *prefix-key* ; swank will kick this off

(in-package :stumpwm)
(ql:quickload :swank)
(swank-loader:init)
(defcommand swank () ()
  (swank:create-server :port 4005
                       :style swank:*communication-style*
                       :dont-close t)
  (echo-string (current-screen)
               "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm)."))
(swank)

(defcommand wanderlust () ()
  (emacs)
  (send-meta-key (current-screen) (kbd "M-x"))
  (window-send-string "wl")
  (send-meta-key (current-screen) (kbd "RET")))
