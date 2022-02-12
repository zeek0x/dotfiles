#!/bin/bash

cd "$(dirname "$0")" && . ./util.sh

function ubuntu () {
  deb_file="./vscode.deb"
  # Get link address from: https://code.visualstudio.com/docs/setup/setup-overview
  curl -sSLo $deb_file "https://go.microsoft.com/fwlink/?LinkID=760868"
  DEBIAN_FRONTEND=noninteractive apt -y install "./${deb_file}"
  rm $deb_file
}

function darwin () {
  brew install --cask visual-studio-code
}

case $(os) in
  darwin ) darwin ;;
  ubuntu ) ubuntu ;;
esac
