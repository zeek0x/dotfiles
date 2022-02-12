DOTFILES := `pwd`
BASH := bash -euo pipefail

all: install git zsh
.PHONY: install git zsh

install:
	@find $(DOTFILES)/install -name "[0-9][0-9]-*.sh" | sort | $(BASH)

git:
	@cp -f "$(DOTFILES)/git/.gitconfig" "${HOME}/.gitconfig"
	@cp -n "$(DOTFILES)/git/.gitconfig.local" "${HOME}/"; true

zsh: zshrc zinit
.PHONY: zshrc zinit

zshrc:
	@$(BASH) "$(DOTFILES)/zsh/build.sh"
	@cp -f "$(DOTFILES)/zsh/_build/.zshrc" "${HOME}/.zshrc"
	@cp -f "$(DOTFILES)/zsh/_build/.zshrc.zwc" "${HOME}/.zshrc.zwc"

zinit:
	@$(BASH) "$(DOTFILES)/zinit/setup.sh"
	@cp -f "$(DOTFILES)/zinit/.p10k.zsh" "${HOME}/.p10k.zsh"
