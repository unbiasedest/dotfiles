export TERM=xterm-256color
# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

#use separate alias file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

#unlimited history
export HISTFILESIZE=
export HISTSIZE=

#paths for Texlive
export PATH=/mnt/work/Latex/texlive/2014/bin/x86_64-linux:$PATH
export MANPATH=/mnt/work/Latex/texlive/2014/texmf/doc/man:$MANPATH
export INFOPATH=/mnt/work/Latex/texlive/2014/texmf/doc/info:$INFOPATH

#vim rules!
set editing-mode vi
#autojump
[[ -s /usr/share/autojump/autojump.bash ]] && . /usr/share/autojump/autojump.bash
#powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/martin/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
