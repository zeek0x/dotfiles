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
export EDITER=vi
export GIT_EDITER=vi

# color
autoload -Uz colors; colors

# completion
fpath=(/usr/local/share/zsh-completions/src $fpath)
autoload -Uz compinit; compinit

# prompt

# normal user
_prompt="%{%B${fg[cyan]}%}%n@%m %(?.😗.🤔) %# %{${reset_color}%b%}"
_prompt2="%{%B${fg[cyan]}%}%_> %{${reset_color}%b%}"
_rprompt="%{%B${fg[magenta]}%}[%~]%{${reset_color}%b%}"
_sprompt="%{%B${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%b%}"

# git
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green} %c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
_rprompt=$_rprompt'${vcs_info_msg_0_}'

# root user
if [ ${UID} -eq 0 ]; then
  _prompt="%U${_prompt}%u"
  _prompt2="%U${_prompt2}%u"
  _rprompt="%U${_rprompt}%u"
  _sprompt="%U${_sprompt}%u"
fi

PROMPT=$_prompt    # 通常のプロンプト
PROMPT2=$_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$_rprompt  # 右側のプロンプト
SPROMPT=$_sprompt  # スペル訂正用プロンプト

# ssh
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# aliases
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -F --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias d='docker $*'
alias d-c='docker-compose $*'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# direnv activate
eval "$(direnv hook zsh)"

# local machine settings
[ -f ~/.local/zsh.local ] && source ~/.local/zsh.local
