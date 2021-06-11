#!/usr/bin/env ksh

# aliases per OS in use

_aliases="$FOLDER/rc/aliases.$OSTYPE"

[[ -e $_aliases ]] && . "$_aliases"
unset -v _aliases

# aliases for both OS

# deal with stupid nano differences in a terrible way
if [[ -e $HOME/.nanorc-${HOSTNAME} ]]; then
    alias nano="nano --rcfile ~/.nanorc-${HOSTNAME}"
elif [[ -e $HOME/.nanorc-${OSTYPE} ]]; then
    alias nano="nano --rcfile ~/.nanorc-${OSTYPE}"
fi

# set up rmate
if whence -pq rmate ; then
    alias rmate='rmate --host auto'
else
    alias rmate='printf "You will need to install rmate from https://github.com/sclukey/rmate-python\n"'
fi

# make emacs more harmless by not allowing it to open the GUI even if it's there
if whence -pq emacs ; then
    alias emacs='emacs -nw'
fi

# load bcrc if it exists since it doesn't happen automatically
if [[ -e $HOME/.bcrc ]]; then
    alias bc='bc -q $HOME/.bcrc'
else
    alias bc='bc -q'
fi

if whence -pq python3 ; then
    alias venv='python3 -m venv'
fi

alias cdb='cd $OLDPWD'
alias cls='tput clear'

alias df='df -h'
alias du='du -ch'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

if whence -pq most; then
    alias m='most'
fi

# stupid dos tricks...
alias md='mkdir'
alias rd='rmdir'
alias cd..='cd ..'

alias edit=\${EDITOR}

# this is bad, should NOT do this...
# leads to BAD habits

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ln='ln -i'

# psgrep using options common to both macOS and LInux
alias psgrep="ps aux | grep -v grep | grep $1"

# from jaybe on #macosx
alias tree=$'find . -print | sed -e \'s;[^/]*/;|____;g;s;____|; |;g\''

# manage dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# human readable path
alias path='printf "${PATH//:/\\n}\n"'

# # Add the remote, call it "upstream":
#
# git remote add upstream https://github.com/whoever/whatever.git
#
# # Fetch all the branches of that remote into remote-tracking branches,
# # such as upstream/master:
#
# git fetch upstream
#
# # Make sure that you're on your master branch:
#
# git checkout master
#
# # Rewrite your master branch so that any commits of yours that
# # aren't already in upstream/master are replayed on top of that
# # other branch:
#
# git rebase upstream/master

alias update_github='git fetch upstream && git checkout master && git rebase upstream/master && git push origin master'
