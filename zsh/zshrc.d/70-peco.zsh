
GHQ_ROOT="$HOME/src"

# Change directory by peco + ghq
function peco_ghq () {
  selected_dir=$(ghq list | peco --prompt="GHQ>" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    selected_dir="$GHQ_ROOT/$selected_dir"
    BUFFER="cd $selected_dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N peco_ghq
bindkey '^G' peco_ghq

# History by peco
function peco-history() {
    BUFFER=$(history -rn 1 | awk '!a[$0]++' | peco --prompt="HISTORY>")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history
bindkey '^R' peco-history

# Find by peco
function peco_find() {
  function source_files() {
    if git rev-parse 2> /dev/null ; then
      git ls-files
    else
      find . -type f
    fi
  }
  selected_file=$(source_files | peco --prompt "FIND>")
  BUFFER="$BUFFER$selected_file"
}
zle -N peco_find
bindkey '^F' peco_find
