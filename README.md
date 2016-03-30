My StumpWM Configuration
=======================

This is my StumpWM config, it contains parens so non-lispers, be aware.

What is StumpWM anyway?
-----------------------

As it says on their [website]:

	"StumpWM is a tiling, keyboard driven X11 Window Manager written entirely in Common Lisp."

"Common Lisp?", you may ask, "why, isn't that the old programming
language that with all those parens?"

Yes it is! Common Lisp is the second oldest programming language still
in use today (FORTRAN is older) (source: [@abelsonsussman1996sicp])

"Okay, now that is all fine and dandy, but why would anyone use it?"

Well, I like to learn new things and programming in Lisp is not only different from more mainstream languages, but it is also a great fun. PLUS with StumpWM I can change any line in my config and just reevaluate it to see the changes I made, there is no need to reload or restart the VM.

It can be a bit of a struggle to install, but the [website] should have all the information you need to set it up.
Another good repository of information is the [Arch Wiki](https://wiki.archlinux.org/index.php/Stumpwm).

Set up this config
------------------

This repo has a submodule called `contrib` which remote points to [stumpwm-contrib's github page](http://github.com/stumpwm/stumpwm-contrib).

To use the code in this repo the submodule needs to be initialized: <br>
(This assumes you are inside a terminal inside this repo)

	> git submodule init
	> git submodule update

Your terminal should now clone the `stumpwm-contrib` repo into the contrib/ directory.

This config is very much created just to suit my needs, so you will have to modify it yourself, but I hope it will shine some light on what you can do with StumpWM and inspire you to create your own specialized config.

Feel free to ask questions or use any of the code!

References
----------------

[website]: http://stumpwm.github.io
[@abelsonsussman1996sicp]: H. Abelson and G. J. Sussman, *Structure and Interpretation of Computer Programs*, second edition. Cambridge, MA: MIT Press, 1996
