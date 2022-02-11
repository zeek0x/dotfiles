DOTFILES := `pwd`
BASH := bash -euo pipefail

all: install git zshrc
.PHONY: install git zshrc

install:
	@find $(DOTFILES)/install -name "[0-9]{2}-*.sh" | $(BASH)

git:
	@ln -sf "$(DOTFILES)/git/.gitconfig" "${HOME}/.gitconfig"
	@cp -n "$(DOTFILES)/git/.gitconfig.local" "${HOME}/"; true

zshrc: zsh zinit
.PHONY: zsh zinit

zsh:
	@$(BASH) "$(DOTFILES)/zsh/build.sh"
	@ln -sf "$(DOTFILES)/zsh/_build/.zshrc" "${HOME}/.zshrc"
	@ln -sf "$(DOTFILES)/zsh/_build/.zshrc.zwc" "${HOME}/.zshrc.zwc"

zinit:
	@$(BASH) "$(DOTFILES)/zinit/setup.sh"
	@ln -sf "$(DOTFILES)/zinit/.p10k.zsh" "${HOME}/.p10k.zsh"
