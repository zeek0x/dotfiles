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
  selected_file=$(source_files | fzf --prompt "FIND>")
  BUFFER="$BUFFER$selected_file"
}
zle -N fzf_find
bindkey '^F' fzf_find

function fco () {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}
