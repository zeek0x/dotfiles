#!/bin/bash

cd "$(dirname "$0")" && . ./util.sh

function darwin () {
  # install brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew upgrade
  brew install vim curl git zsh peco
}

function ubuntu () {
  apt-get update -y
  apt-get upgrade -y
  apt-get install -y vim curl git zsh peco locales-all
}

case $(os) in
  darwin ) darwin ;;
  ubuntu ) ubuntu ;;
esac
