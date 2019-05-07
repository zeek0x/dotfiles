#!/bin/bash

DOT_FILES=(.zshrc .tmux.conf .gitconfig.common)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/bin/dotfiles/$file $HOME/$file
done

# For Git. (Git is unable to read symbolic link to .gitconfig ???)
cp $HOME/bin/dotfiles/.gitconfig $HOME/.gitconfig

# zsh completions
mkdir -p $HOME/.zsh/completion
git clone git://github.com/zsh-users/zsh-completions.git $HOME/.zsh/zsh-completions
curl -L https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > $HOME/.zsh/completion/git-completion.bash
curl -L https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh > $HOME/.zsh/completion/_git
curl -L https://raw.github.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
rm -f ~/.zcompdump;

# zsh local
# ln -s $HOME/bin/dotfiles/.zshrc.ubuntu $HOME/.zsh/.zshrc.local
