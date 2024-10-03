alias refzsh="source ~/.zshrc"
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
alias d='docker'

case "$OSTYPE" in
  darwin*)
    alias ls="ls -FG"
    alias la='ls -A'
    alias ll='ls -alF'
    alias l='ls -CF'

    alias awk='gawk'
    alias sed='gsed'
    alias date='gdate'
    alias grep='ggrep'
    alias tar='gtar'
    ;;
  linux*)
    alias ls='ls -F --color=auto'
    alias la='ls -A'
    alias ll='ls -alF'
    alias l='ls -CF'

    alias open='xdg-open'
    ;;
esac
