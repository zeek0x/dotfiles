
fpath=($HOME/.zsh/completions/src $fpath)
autoload -U colors; colors
autoload -Uz compinit; compinit -d ${HOME}/.zcompdump
