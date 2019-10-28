#!/bin/bash

DOT_FILES=(.zshrc .gitconfig)

for file in "${DOT_FILES[@]}"
do
  [ ! -L "$HOME/$file" ] && ln -s "$PWD/$file" "$HOME/$file"
done

HOME_ZSH=$HOME/.zsh
[ ! -d "$HOME_ZSH" ] && mkdir "$HOME_ZSH";

# zsh completions
if [ ! -d "$HOME_ZSH/zsh-completions" ]; then
  ghq get https://github.com/zsh-users/zsh-completions.git

  ZSH_COMPLETIONS=$(ghq list --full-path zsh-completions)

  GIT_BASH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.bash"
  GIT_ZSH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh"
  DOCKER_ZSH_URL="https://raw.github.com/docker/cli/master/contrib/completion/zsh/_docker"
  curl -sL "$GIT_BASH_URL" > "$ZSH_COMPLETIONS/src/git-completion.bash"
  curl -sL "$GIT_ZSH_URL" > "$ZSH_COMPLETIONS/src/_git"
  curl -sL "$DOCKER_ZSH_URL" > "$ZSH_COMPLETIONS/src/_docker"

  ln -s "$ZSH_COMPLETIONS" "$HOME_ZSH/zsh-completions"
  rm -f ~/.zcompdump;
fi

# oh-my-zsh
ghq get https://github.com/robbyrussell/oh-my-zsh.git
ZSH_CACHE_DIR=$HOME_ZSH/cache
[ ! -d "$ZSH_CACHE_DIR" ] && mkdir "$ZSH_CACHE_DIR"

# zsh local
[ ! -L "$HOME_ZSH/.zshrc.local" ] && ln -s "$PWD/.zshrc.$(uname)" "$HOME_ZSH/.zshrc.local"
