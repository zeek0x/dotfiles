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
export LESS='-g -i -M -R -S -W -z-4 -x4'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# fzf
export FZF_DEFAULT_OPTS="--ansi --reverse --border"

# direnv
[ $(command -v direnv) ] && eval "$(direnv hook zsh)"
