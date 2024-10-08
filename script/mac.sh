#!/bin/bash

# brew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew install curl git zsh zsh-completions fzf ghq direnv vim jq go shellcheck
brew install binutils coreutils diffutils findutils gawk gnu-sed gnu-tar grep gzip
brew tap homebrew/cask-fonts
brew install --cask font-fira-code visual-studio-code
