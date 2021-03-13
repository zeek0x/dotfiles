DOTFILES=${PWD}

all: install git zshrc
.PHONY: install git zshrc

install:
	@find install -name "[0-9][0-9]*.sh" | bash

git:
	@ln -sf "$(DOTFILES)/git/.gitconfig" "${HOME}/.gitconfig"
	@cp -n "$(DOTFILES)/git/.gitconfig.local" "${HOME}/"; true

zshrc: zsh zinit
.PHONY: zsh zinit

zsh:
	@bash "$(DOTFILES)/zsh/build.sh"
	@ln -sf "$(DOTFILES)/zsh/_build/.zshrc" "${HOME}/.zshrc"
	@ln -sf "$(DOTFILES)/zsh/_build/.zshrc.zwc" "${HOME}/.zshrc.zwc"

zinit:
	@bash "$(DOTFILES)/zinit/setup.sh"
	@ln -sf "$(DOTFILES)/zinit/.p10k.zsh" "${HOME}/.p10k.zsh"
