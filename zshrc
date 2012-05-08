ZSH=$HOME/.oh-my-zsh

ZSH_THEME="antonishen"

plugins=(git rvm brew gem osx ruby rails)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:${PATH}
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

export JASMINE_BROWSER=chrome

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
__rvm_project_rvmrc
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

setopt auto_cd
cdpath=($HOME/Dropbox/Code)

# make <C-s> work in terminal vim
stty -ixon

# ignore duplicate history entries
setopt histignoredups

# Bindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

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
alias gs="git status"
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
