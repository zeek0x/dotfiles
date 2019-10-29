#!/bin/zsh

rm $HOME/.zcompdump
fpath=($HOME/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit; compinit
