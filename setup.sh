#!/bin/bash

DOT_FILES=(.zshrc .zshenv .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/bin/dotfiles/$file $HOME/$file
done
