#Basic Bash
alias ls='ls --color=auto'
alias pyls='ls *.py --color=auto'
alias pdfls='ls *.pdf --color=auto'
alias grep='grep --color=auto'
alias pygrep='grep --color=auto -iR --include \*.py fit'
alias ll='ls -la'
alias a='alias'
alias llg='ll | grep' # grep ll output
alias aedit='vi ~/dotfiles/bash_aliases'
alias asource='source ~/dotfiles/bash_aliases'
alias rm="rm -i" # Confirm file removal
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder

#Keyboard shortcuts
alias zhk='cat ~/.zshrc | grep bindkey' # zsh 
alias vihk='cat ~/.vimrc | grep leader' # vim-leaders
alias src='esc.sh' # swap capslock and escape


#History
alias h='history 1'
alias hg='history 1| grep'

#Cool command line tools
alias r='ranger'
alias m='w3mman'
alias z='zathura'
alias feh='feh --scale-down --auto-zoom'

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
alias stex='cd ~/studienarbeit && vim --servername tex studienarbeit.latex'
alias doku='cd ~/SA-Doku && vim --servername doku doku.latex'
alias texplots='cd ~/ownCloud/university/studienarbeit/texplots'
alias vicsv='vi files.txt && rfilename.sh files.txt && vi *.vcsv'
alias viserver='vim --servername tex '
# alias zotero='source ~/Zotero_linux-x86_64/zotero &'
