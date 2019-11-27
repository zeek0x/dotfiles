export LANG=ja_JP.UTF-8     # 文字コードをUTF-8に設定
bindkey -e                  # キーバインドを emacs に設定

# 16.2.1 Changing Directories
setopt auto_cd              # ディレクトリ名のみ入力時、cdを適応させる
setopt auto_pushd           # cd実行時、ディレクトリスタックにpushされる
setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除

# 16.2.2 Completion
setopt auto_list            # 補完候補が複数ある時に、一覧表示
setopt auto_menu            # タブで補完候補を表示する
setopt auto_param_keys      # カッコの対応などを自動的に補完
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

# Histroy File
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

#  editer set
export EDITOR=vi
export GIT_EDITOR=vi

# completion
fpath=($HOME/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit; compinit -d $HOME/.zcompdump
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-separator '|'
zstyle ':completion:*:manuals' separate-sections true

# completion select by vi cursor
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# oh-my-zsh
export ZSH=$(ghq list --full-path oh-my-zsh)
export ZSH_CACHE_DIR=$HOME/.zsh/cache
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# [agnoster] Context: user (who am I)
prompt_context() {
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
}

# [agnoster] Dir: current working directory
prompt_dir() {
  prompt_segment cyan $CURRENT_FG '%c'
}

# aliases
alias ...='cd ../..'
alias ....='cd ../../..'

# direnv activate
[ `command -v direnv` ] && eval "$(direnv hook zsh)"

# local machine settings
[ -f ~/.zsh/.zshrc.local ] && source ~/.zsh/.zshrc.local
