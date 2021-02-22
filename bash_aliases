# -*- mode: sh -*-

# only use aliases that is cross platform between linux and BSD.

# Emacs
export EDITOR="emacs -nw"
alias e='emacs -nw'

# ssh with color
alias ssh='TERM=xterm-256color ssh'

alias ll='ls -lah'
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

# rsync_deploy ~/dotfiles/emacs_config tianshuo@imac.local
function rsync_deploy {
    project_dir=$1
    user_remote=$2

    if [ "$#" -ne 2 ]
    then
        echo "Need 2 argument. but $# is provided."
        echo "rsync [project_dir] [user_remote]"
        return 1
    fi

    if [[ ! -d $project_dir/.git ]]
    then
        echo "Current dir is not a git project. $project_dir/.git does not exist!"
        return 1
    fi

    echo "Deploying $project_dir..."
    oldd=`pwd`
    cd $project_dir

    # Create ~/deploy_root if not exists.
    ssh "tianshuo@imac.local" bash <<'EOF'
ROOT=~/deploy_root
if [[ ! -d $ROOT ]]
then
  echo "$ROOT NOT exists, creating one"
  mkdir -p $ROOT
fi
EOF

    project_name=$(basename `pwd`)
    tmp_dir=/tmp/$project_name
    mkdir -p $tmp_dir
    git --work-tree=$tmp_dir checkout HEAD -- .
    rsync -aP  --delete $tmp_dir/ $user_remote:~/deploy_root/$project_name
    rm -rf $tmp_dir
    cd $oldd
}

function rsync_deploy_this {
    rsync_deploy ./ $1
}

# microk8s shortcuts
alias kubectl='microk8s kubectl'
alias go_earth='ssh -t tsdeng@dengtianshuo.com -p 2323'
