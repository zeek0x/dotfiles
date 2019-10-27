#!/bin/bash

DOT_FILES=(.zshrc .tmux.conf .gitconfig)

for file in ${DOT_FILES[@]}
do
  [ ! -L $HOME/$file ] && ln -s $PWD/$file $HOME/$file
done

# zsh
HOME_ZSH=$HOME/.zsh
[ ! -d $HOME_ZSH ] && mkdir $HOME_ZSH;

if [ ! -d $HOME_ZSH/zsh-completions ]; then
  ghq get git://github.com/zsh-users/zsh-completions.git

  ZSH_COMPLETIONS=$(ghq list --full-path zsh-completions)

  GIT_BASH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.bash"
  GIT_ZSH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh"
  DOCKER_ZSH_URL="https://raw.github.com/docker/cli/master/contrib/completion/zsh/_docker"
  curl -sL $GIT_BASH_URL > $ZSH_COMPLETIONS/src/git-completion.bash
  curl -sL $GIT_ZSH_URL > $ZSH_COMPLETIONS/src/_git
  curl -sL $DOCKER_ZSH_URL > $ZSH_COMPLETIONS/src/_docker

  ln -s $ZSH_COMPLETIONS $HOME_ZSH/zsh-completions
  rm -f ~/.zcompdump;
fi

[ ! -L $HOME_ZSH/.zshrc.local ] && ln -s $PWD/.zshrc.$(uname) $HOME_ZSH/.zshrc.local
