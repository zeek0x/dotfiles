#!/bin/bash

cd "$(dirname "$0")" && . ./util.sh

function darwin () {
  brew install go
}

function ubuntu () {
  # The following code didn't work for Darwin.
  # See: https://github.com/zeek0x/dotfiles/issues/2
  curl -LO "https://get.golang.org/$(uname)/go_installer"
  chmod +x go_installer
  ./go_installer
  rm go_installer
}

case $(os) in
  darwin ) darwin ;;
  ubuntu ) ubuntu ;;
esac
