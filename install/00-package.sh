#!/bin/bash

cd "$(dirname "$0")" && . ./util.sh

function darwin () {
  # install brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew upgrade
  brew install vim curl git zsh peco shellcheck
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
}

function ubuntu () {
  apt-get update -y
  apt-get upgrade -y
  apt-get install -y vim curl git zsh peco shellcheck fonts-firacode locales-all
}

case $(os) in
  darwin ) darwin ;;
  ubuntu ) ubuntu ;;
esac
