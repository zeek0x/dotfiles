
# completion
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-separator '|'
zstyle ':completion:*:manuals' separate-sections true

# completion select by vi cursor
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
