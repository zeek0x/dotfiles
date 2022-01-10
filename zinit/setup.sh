#!/bin/bash

cd "$(dirname "$0")" || return

curl -fsSL https://git.io/zinit-install | bash
zsh -c "source $HOME/.zshrc && zinit self-update"

find ./zshrc.d -maxdepth 1 -name "*.zsh" | xargs cat >> "$HOME/.zshrc"
