case "$OSTYPE" in
  darwin*)
    alias ls='ls -F -G'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias ls="ls -FG" ;;
  linux*)
    alias ls='ls -F --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF' ;;
esac

alias refzsh="source $HOME/.zshrc"
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
