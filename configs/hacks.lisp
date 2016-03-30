(setf *user-stumpwm-directory* "~/.stumpwm.d/")
(add-to-load-path (concat *user-stumpwm-directory* "contrib/util/stumptray/"))

;; Load stumptray module
(load-module "stumptray")

;; Run a setxkbmap with a few options.
(run-shell-command "$HOME/.local/bin/fix-keyboard")
