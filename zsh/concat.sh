#!/bin/bash

cd "$(dirname "$0")" || return

files=$(find ./zshrc.d -maxdepth 1 -name "[0-9][0-9]*.zsh" | sort)
echo "$files" | while read -r file; do
    cat "$file" && echo
done
