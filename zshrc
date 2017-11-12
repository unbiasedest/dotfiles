export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$PATH:$HOME/ownCloud/scripts
export PYTHONPATH=$PYTHONPATH:$HOME/ownCloud/university/studienarbeit/texplots:$HOME/oo-design/src
export QEMU_AUDIO_DRV=alsa
export KEYTIMEOUT=1

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
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history autocd extendedglob nomatch 
# End of lines configured by zsh-newuser-install

#ls on cd
chpwd() ls --color=auto

# KEYBOARD SHORTCUTS
# dir_up
	function dir_up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N dir_up_widget
	bindkey "^k" dir_up_widget
# prev_dir
	function dir_prev_widget() {
		BUFFER="cd -"
		zle accept-line
	}
	zle -N dir_prev_widget
	bindkey "^b" dir_prev_widget
# git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare
# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home
# Edit and rerun
	function edit_and_run() {
		BUFFER="fc"
		zle accept-line
	}
	zle -N edit_and_run
	bindkey "^v" edit_and_run
# LS
	function list_dir() {
		BUFFER="ls"
		zle accept-line
	}
	zle -N list_dir
	bindkey "^l" list_dir

# incremental history search
bindkey '^r' history-incremental-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# accept autosuggestion with CTRL-F
bindkey '^f' autosuggest-accept
# reverse tab for tab-completion
bindkey '^[[Z' reverse-menu-complete

# VIM line edit
bindkey -v
# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
 function TRAPINT() {
   vim_mode=$vim_ins_mode
   zle && zle reset-prompt
     return $(( 128 + $1 ))
     }
# Normal mode indicator on prompt
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[red]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# PROMPT
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

# NOTE FUNCTIONS
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

# AUTOSUGGESTIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=green

# SYNTAX HIGHLIGHTING
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
ZSH_HIGHLIGHT_STYLES[alias]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=blue
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=none
ZSH_HIGHLIGHT_STYLES[path]=fg=none
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=black,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=orange
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none

