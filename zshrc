export TERM="xterm-256color-italic"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$HOME/anaconda3/bin:$PATH
export KEYTIMEOUT=20
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
setopt inc_append_history autocd extendedglob nomatch 
bindkey -v
# End of lines configured by zsh-newuser-install

#prompt

# edit command line
autoload -Uz edit-command-line
vim_ins_mode="%{$fg[cyan]%}[i]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[n]%{$reset_color%}"

function zle-keymap-select() {
    zle reset-prompt
    zle -R
vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    }
zle -N zle-keymap-select


# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
 function TRAPINT() {
   vim_mode=$vim_ins_mode
   zle && zle reset-prompt
     return $(( 128 + $1 ))
     }

# don't display PROMPT for previously accepted lines; only display it next to current line
autoload -U colors && colors
PROMPT="%{$fg_bold[blue]%}%n%{$reset_color%}%{$fg[blue]%}(%m%)%{$reset_color%}> "
#use separate alias file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

fi

#Powerline
#if [[ -r /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
 # Opens a note
n() {
    vim -c ":Note $*" 
    }
# Searches Notes
ns() {
    ls -c ~/owncloud/notes | egrep -i "$*"
    }

### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize
zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
### END ###
