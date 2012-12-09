# .bash_profile

#
# F.2012-11-03 Sat. : See http://geekscrap.com/2010/02/using-screen-as-your-login-shell/
#
if [ ${SHLVL} -eq 1 ]; then
    ((SHLVL+=1)); export SHLVL
    #exec screen -R -e "^Ee" ${SHELL} -l
    screen -R -e "^Ee" ${SHELL} -l
    ((SHLVL-=1)); export SHLVL
    echo
    echo "///////////////////////////////////////////////////////"
    echo "~/.bash_profile: End of screen-itized session, SHLVL=$SHLVL"
    echo "///////////////////////////////////////////////////////"
    echo
fi

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# F.2011-08-16
export LANG=en_US.UTF-8
export HISTSIZE=1024
export HISTFILESIZE=4096

#
# F.2011-08-16 : Source additional things.
#
if [ -d ~/.bash_profile.d ]; then
    for script in ~/.bash_profile.d/*.sh; do
        [ -r "$script" ] && source "$script"
    done
fi

# F.2010-08-16 : Additional binary paths.
[ -d ~/bin       ] && pathprepend ~/bin
[ -d ~/tools/bin ] && pathprepend ~/tools/bin

echo "Your environment:"
for e in HOSTNAME LANG LD_LIBRARY_PATH PATH ; do
    echo "   $e = ${!e}"
done

# F.2011-08-16 : Prompt color, slightly modified from BLFS.
# Setup a red prompt for root and a green one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
CYAN="\[\e[1;36m\]"
YELLOW="\[\e[33;1m\]"
WHITE="\[\e[37;1m\]"
if [[ $EUID == 0 ]] ; then
    USERATHOST=$RED
else
    USERATHOST=$GREEN
fi
PS1="$USERATHOST\u@\h $YELLOW\j $WHITE\w $USERATHOST\\$ $NORMAL"
PS2="$USERATHOST> $NORMAL"

# Gentoo's PS1 : \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]

# F.2011-08-16 : Some aliases...
alias fu='/sbin/fuser -v'
alias ll='ls -l'
alias lla='ll -a'
alias lsof='/usr/sbin/lsof'
alias papache='( httpd_pids=`pgrep -u $USER,ppr,noukpo,root httpd` ; [ ! "$httpd_pids" ] || ps -H u -p $httpd_pids )'
alias vd='vimdiff'
alias vi='vim'
alias sls='screen -ls'
alias sr='screen -r'
alias sR='screen -R'

# F.2011-08-24 : Some Git aliases.
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcf='git cat-file'
alias gco='git checkout'
alias gd='git diff --patience'
alias gdc='gd --cached'
alias gdhf='gd HEAD..FETCH_HEAD'
alias gl='git log --graph --stat --summary --decorate --source --abbrev-commit'
alias gl1='git log --oneline --graph --decorate --source'
alias glhf='gl HEAD..FETCH_HEAD'
alias gls='git ls-files'
alias gmt='git mergetool'
alias gr='git remote'
alias gru='git remote update'
alias gs='git status'
alias gs.='gs .'
alias gsb='git show-branch'
alias gsh='git show'
alias gsu='git status -uno'
alias gt='git tag'

# F.2012-10-31 : List of screens.
#screen -ls

