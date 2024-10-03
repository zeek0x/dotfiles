# Key settings
bindkey -e

# Language
export LANG=ja_JP.UTF-8

# Histroy
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# Editor
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'

# less
export LESS='-i -M -R'

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# fzf
export FZF_DEFAULT_OPTS="--ansi --reverse --border"

# direnv
[ $(command -v direnv) ] && eval "$(direnv hook zsh)"
