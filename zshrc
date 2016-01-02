export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$HOME/anaconda3/bin:$PATH
# The following lines were added by compinstall

zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/martin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch 
bindkey -v
# End of lines configured by zsh-newuser-install

#prompt


PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: '

#use separate alias file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

#Powerline
if [[ -r /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
