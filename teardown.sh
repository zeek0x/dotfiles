#!/bin/bash

TARGETS=(.zshrc .gitconfig .zsh)

for tar in "${TARGETS[@]}"
do
  TARGET="$HOME/$tar"
  [ -L "$TARGET" ] && OPTION="" || OPTION="-ri"
  rm "$OPTION" "$TARGET"
done