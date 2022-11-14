#!/bin/bash

function get() {
  dir=$1
  name=$2
  raw="https://raw.githubusercontent.com/zeek0x/dotfiles/master"
  curl -fsSL "$raw/$name" > "$dir/$name"
}

get "$HOME" .zshrc
get "$HOME" .p10k.zsh
get "$HOME" .gitconfig
get "$HOME" .gitconfig.local
mkdir -p "$HOME/.config/git" && get "$HOME/.config/git" .gitignore
