#!/bin/bash

cd "$(dirname "$0")" || return

BUILD_DIR=./_build

rm -rf "$BUILD_DIR"; mkdir "$BUILD_DIR"
find ./zshrc.d -maxdepth 1 -name "[0-9][0-9]*.zsh" | sort | xargs cat >> "$BUILD_DIR/.zshrc"

zsh -c "zcompile $BUILD_DIR/.zshrc"
zsh -c "autoload -Uz compinit && compinit"
