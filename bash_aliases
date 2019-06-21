# -*- mode: sh -*-

# only use aliases that is cross platform between linux and BSD.

# Emacs
export EDITOR="emacs -nw"
alias e='emacs -nw'

# Colorful terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Better ls
# -G enable colorized output
# -F add readable suffix / for dir, * for executable, @ for link, etc.
# -h human readable size unit.
alias ls='ls -GFh'
alias ll='ls -GFlah'

# grep with color
alias grep='grep --color=auto'

# ssh with color
alias ssh='TERM=xterm-256color ssh'

# go_earth
alias go_earth='ssh -t tsdeng@dengtianshuo.com -p 2323'

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
