#!/bin/bash

DOTFILES=$(pwd)
BASH="bash -euo pipefail"

function _install() {
  find "$DOTFILES/install" -name "[0-9][0-9]-*.sh" | sort | $BASH
}

function _git () {
  cp -f "$DOTFILES/git/.gitconfig" "${HOME}/.gitconfig"
  cp -n "$DOTFILES/git/.gitconfig.local" "${HOME}/" || true
}

function _zshrc () {
  $BASH "$DOTFILES/zsh/build.sh"
  cp -f "$DOTFILES/zsh/_build/.zshrc" "${HOME}/.zshrc"
  cp -f "$DOTFILES/zsh/_build/.zshrc.zwc" "${HOME}/.zshrc.zwc"
}

function _zinit () {
  $BASH "$DOTFILES/zinit/setup.sh"
  cp -f "$DOTFILES/zinit/.p10k.zsh" "${HOME}/.p10k.zsh"
}

ZSHRC_ONLY="false"

function parse_options() {
  for OPT in "$@"
  do
    case "$OPT" in
      "-z" | "--zshrc-only" )
        ZSHRC_ONLY="true"
        ;;
      * )
        continue
        ;;
    esac
    shift
  done
}

parse_options "$@"

TASKS=$(
  if $ZSHRC_ONLY
  then
    echo "_zshrc"
  else
    echo "_install" "_git" "_zshrc" "_zinit"
  fi
)

for TASK in $TASKS
do
  $TASK
done
