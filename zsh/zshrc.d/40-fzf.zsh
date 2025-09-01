# Change directory by fzf + ghq
function fzf_ghq () {
  selected_dir=$(ghq list | fzf --prompt="GHQ>")
  if [ -n "$selected_dir" ]; then
    ghq_root=$(ghq root)
    selected_dir="$ghq_root/$selected_dir"
    BUFFER="cd $selected_dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf_ghq
bindkey '^G' fzf_ghq

# Find by fzf
function fzf_find() {
  function source_files() {
    if git rev-parse 2> /dev/null ; then
      git ls-files
    else
      find . -type f
    fi
  }
  selected_file=$(source_files | fzf --prompt "Find>")
  BUFFER="$BUFFER$selected_file"
}
zle -N fzf_find
bindkey '^F' fzf_find

# Git checkout by fzf
function fzf_checkout() {
  f() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
      echo "error: Not a git repository." >&2
      exit 1
    fi
    target=$({
        git for-each-ref --format=$'\033[34;1mbranch\033[m\t%(refname:short)' refs/heads refs/remotes
        git tag | sed $'s/^/\033[35;1mtag\033[m\t/'
      } | fzf \
        -n 2 \
        --prompt "Branch or Tag> " \
        --height=60% \
        --preview="git log -150 --pretty=format:'%s' ..{2}" \
        --preview-window=down:6:wrap
    ) || exit 1
    git checkout "$(cut -f2 <<<"$target")" || exit 1
  }; (f)
}
# alias
function fco() {
  fzf_checkout "$@"
}

# History by fzf
function fzf_history() {
  BUFFER=$(history -n -r 1 | awk '!seen[$0]++' | fzf \
    --prompt "History> " \
    --height=60% \
    --query "$LBUFFER" \
    --no-sort \
    --preview "echo {}" \
    --preview-window=down:3:wrap)
    CURSOR="$#BUFFER"
    zle reset-prompt
}
zle -N fzf_history
bindkey '^r' fzf_history

# Emoji selection by fzf
function fzf_emoji () {
  cache_dir="$HOME/.cache"
  mkdir -p "$cache_dir"
  cache="$cache_dir/emoji.txt"
  if [ ! -f "$cache" ] ; then
    curl -sSL -o "$cache" 'https://git.io/JXXO7'
  fi
  cat $cache | fzf -m
}
