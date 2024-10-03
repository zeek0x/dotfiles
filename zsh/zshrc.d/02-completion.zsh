# '/' and '.' are also word separators
autoload -Uz select-word-style; select-word-style default
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified

# completion ui
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-separator '|'
zstyle ':completion:*:manuals' separate-sections true

# edit command line by vi
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^O' edit-command-line

# completion select by vi cursor
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
