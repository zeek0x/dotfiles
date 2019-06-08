#!/bin/bash

DIR="$HOME/bin/dotfiles"
DOT_FILES=(.zshrc .tmux.conf .gitconfig)

for file in ${DOT_FILES[@]}
do
  ln -s $DIR/$file $HOME/$file
done

# zsh completions
GIT_BASH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.bash"
GIT_ZSH_URL="https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh"
DOCKER_ZSH_URL="https://raw.github.com/docker/cli/master/contrib/completion/zsh/_docker"
curl -L $GIT_BASH_URL > $DIR/zsh-completions/src/git-completion.bash
curl -L $GIT_ZSH_URL > $DIR/zsh-completions/src/_git
curl -L $DOCKER_ZSH_URL > $DIR/zsh-completions/src/_docker
[ -d $HOME/.zsh ] || mkdir $HOME/.zsh
ln -s $DIR/zsh-completions $HOME/.zsh/
rm -f ~/.zcompdump;

# zsh local
# ln -s $HOME/bin/dotfiles/.zshrc.ubuntu $HOME/.zsh/.zshrc.local
