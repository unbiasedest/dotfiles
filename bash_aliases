#Basic Bash
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'
alias a='alias'
alias llg='ll | grep'
alias aedit='vi ~/dotfiles/bash_aliases'
alias asource='source ~/dotfiles/bash_aliases'

#History
alias h='history 1'
alias hg='history 1| grep'

#Cool command line tools
alias r='ranger'
alias m='w3mman'

#Home network
alias nortonssh='ssh -Y pi@192.168.0.101'
alias nortonvnc='vncviewer norton:1' 
alias psixvnc='vncviewer 192.168.0.103:5911:11' 

#Ipython
alias ipnb='cd $HOME/ownCloud/python/notebooks/ && jupyter notebook'

#Notes
alias nd='cd $HOME/ownCloud/notes'
alias orgd='cd $HOME/ownCloud/orgzly'

#Scripting
alias cdscripts='cd $HOME/ownCloud/scripts'

#Studienarbeit
alias tuvpn='nmcli con up 0d3a4940-900d-486a-8e30-0a25239eb32e' 
alias ask_tuvpn='nmcli --ask con up 0d3a4940-900d-486a-8e30-0a25239eb32e' 
alias sgd='cd ~/Oracle\ Secure\ Global\ Desktop/clients/i3li/5.00.907 && ./ttatcc'
alias stex='cd ~/studienarbeit && tmux rename-session SA-tex && vim studienarbeit.latex'
alias cdsascripts='cd ~/ownCloud/university/studienarbeit/scripts'
# alias zotero='source ~/Zotero_linux-x86_64/zotero &'
