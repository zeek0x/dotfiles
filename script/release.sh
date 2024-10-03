#!/bin/bash

cd "$(dirname "$0")/.." || return

if [ $# -lt 1 ]; then
  echo "Usage: $0 release-1.0.0.zip"
  exit 1
fi

DIR=dotfiles
RELEASE_FILENAME="$1"

mkdir "$DIR"
zsh/concat.sh > "$DIR/.zshrc"
cp "zinit/.p10k.zsh" "$DIR"
cp git/.git* "$DIR"

zip -r "$RELEASE_FILENAME" "$DIR"
rm -r "$DIR"
