ZSH=$HOME/.oh-my-zsh

ZSH_THEME="antonishen"

plugins=(git rvm brew gem osx ruby rails)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH=/usr/local/lib/node_modules:/usr/local/share/npm/bin/:$PATH

export JASMINE_BROWSER=chrome

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export rvm_project_rvmrc=0

setopt auto_cd
export CDPATH=.:$HOME/Dropbox/Code:$HOME/Dropbox/Work

# make <C-s> work in terminal vim
stty -ixon

# disable autocorrect
unsetopt correct_all

# ignore duplicate history entries
setopt histignoredups

# BINDINGS
bindkey "^b" beginning-of-line

# ALIASES
alias rm="rm -i"

# tmux
alias t="tmux -u new -s"
alias ta="tmux attach-session -t"
alias tls="tmux list-sessions"

# bundler
alias be="bundle exec"

# git
alias gco="git checkout"
alias gci="git commit -v"
alias grb="git rebase"
alias ga="git add"
alias gaa="git add --all"
alias gap="git add -p"
alias gs="git status -sb"
alias gsv="git status"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git l"
alias gll="git ll"
alias gp="git push"
alias gm="git merge"

# rvm
alias rgu="rvm gemset use"

# rails
alias rg="rails generate"
alias rd="rails destroy"

# 'prev' will cd you to the last directory that you cd'ed into
export PREV_PATH=$HOME/.prev-path

# run everytime you cd
function chpwd {
  echo $(pwd) >! $PREV_PATH
}

prev() {
  if [[ -f $PREV_PATH ]]; then
    echo "$(cat $PREV_PATH)"
    cd "$(cat $PREV_PATH)"
  fi
}
