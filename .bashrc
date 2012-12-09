# .bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# F.2012-09-27 : Gentoo seems not to source any /etc/bashrc here.

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# F.2011-08-16 : Source additional custom rc scripts :
if [ -d ~/.bashrc.d ]; then
    for script in ~/.bashrc.d/*.sh; do
        [ -r "$script" ] && source "$script"
    done
fi
