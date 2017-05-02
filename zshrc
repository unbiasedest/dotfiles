export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$PATH:$HOME/ownCloud/scripts
export PYTHONPATH=$PYTHONPATH:$HOME/ownCloud/university/studienarbeit/scripts
export QEMU_AUDIO_DRV=alsa
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
 # Opens a note
n() {
    vim -c ":Note $*" 
    }
# Searches Notes
# note content
ns() {
    grep -Ri "$*" ~/ownCloud/notes
    }
# note title
nls() {
    ls -c ~/ownCloud/notes | egrep -i "$*"
    }


# syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bould
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=blue
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=none
ZSH_HIGHLIGHT_STYLES[path]=fg=none
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=orange
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none
