# Auto compile
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# Language
export LANG=ja_JP.UTF-8

# Key settings
bindkey -e

# Histroy
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

# Editor
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'

# less
export LESS='-i -M -R'

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# fzf
export FZF_DEFAULT_OPTS="--ansi --reverse --border"

# Color
autoload -Uz colors; colors

# '/' and '.' are also word separators
autoload -Uz select-word-style; select-word-style default
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified

# completion ui
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-separator '|'
zstyle ':completion:*:manuals' separate-sections true

# completion select by vi cursor
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# 16.2.1 Changing Directories
setopt auto_cd              # ディレクトリ名のみ入力時、cdを適応させる
setopt auto_pushd           # cd実行時、ディレクトリスタックにpushされる
setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除

# 16.2.2 Completion
setopt auto_list            # 補完候補が複数ある時に、一覧表示
setopt auto_menu            # タブで補完候補を表示する
setopt auto_param_keys      # カッコの対応などを自動的に補完
setopt complete_in_word
# unsetopt list_beep
setopt no_list_beep         # 補完候補表示時にビープ音を鳴らさない
setopt list_packed          # 補完結果をできるだけ詰める

# 16.2.3 Expansion and Globbing
setopt equals               # =commandを`which command`と同じ処理
setopt magic_equal_subst    # 引数での=以降も補完(--prefix=/usrなど)
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する

# 16.2.4 Histroy
setopt bang_hist            # !を使った履歴展開を行う(d)
setopt extended_history     # 履歴に実行時間も保存する
setopt hist_find_no_dups    # ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
setopt hist_ignore_dups     # 入力したコマンドが直前のものと同一なら履歴に登録しない
setopt hist_no_store        # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks   # 余分なスペースを削除して履歴に保存する
setopt share_history        # 他のシェルのヒストリをリアルタイムで共有する

# 16.2.6 Input/Output
setopt correct              # コマンドのスペルを訂正する
setopt interactive_comments # コマンドラインでの#以降をコメントと見なす

# 16.2.8 Prompting
setopt prompt_subst         # プロンプト定義内で変数置換やコマンド置換を扱う

# 16.2.12 Zle
# unsetopt beep
setopt no_beep              # ビープ音を鳴らさない

case "$OSTYPE" in
  darwin*)
    alias ls="ls -FG"
    alias la='ls -A'
    alias ll='ls -alF'
    alias l='ls -CF'

    alias awk='gawk'
    alias sed='gsed'
    alias date='gdate'
    alias grep='ggrep'
    alias tar='gtar'
    ;;
  linux*)
    alias ls='ls -F --color=auto'
    alias la='ls -A'
    alias ll='ls -alF'
    alias l='ls -CF'
    ;;
esac

alias refzsh="source ~/.zshrc"
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
alias d='docker'

[ $(command -v direnv) ] && eval "$(direnv hook zsh)"

##################################################
#                      fzf                       #
##################################################

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

function fdrm() {
  docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

function fdrmi() {
  docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

function femoji () {
  cache="$HOME/.emoji_list"
  if [ -n $cache ] ; then
    curl -sSL -o $cache 'https://git.io/JXXO7'
  fi
  selected_emoji=$(cat $cache | fzf)
  echo $selected_emoji
}

##################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})<E2><80><A6>%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit plugins
zinit light 'paulirish/git-open'
zinit light 'mollifier/cd-gitroot'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-completions'
zinit light 'greymd/docker-zsh-completion'
zinit light 'zdharma-continuum/fast-syntax-highlighting'
zinit light 'zdharma/history-search-multi-word'
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q
zinit snippet OMZT::gnzh
zinit light romkatv/powerlevel10k

# Load completion
autoload -Uz compinit; compinit -d ~/.zcompdump

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Local settings
[ -r ~/.zshrc.local ] && . ~/.zshrc.local
