# -*- mode: sh -*-

# only use aliases that is cross platform between linux and BSD.

# Emacs
export EDITOR="emacs -nw"
alias e='emacs -nw'

# ssh with color
alias ssh='TERM=xterm-256color ssh'

# git shortcuts
alias gst='git status'
alias gco='git checkout'
alias glg='git lg'
alias gci='git commit'
alias gad='git add'
alias gbr='git branch'
alias gps='git push'
alias gpl='git pull'
alias gmg='git merge'
alias gdf='git diff'
alias go_earth='ssh -t tsdeng@dengtianshuo.com -p 2323'
