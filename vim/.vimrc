" 基本設定
set nocompatible              " vi 互換モードを無効化
set encoding=utf-8            " ファイルエンコーディングをUTF-8に設定
set fileencoding=utf-8        " ファイル保存時のエンコーディングをUTF-8に設定
set backspace=indent,eol,start " バックスペースキーの動作を改善
set history=1000              " コマンド履歴のサイズ
set noerrorbells              " エラーベルを鳴らさない
set hidden                    " バッファが編集中でもそのほかのファイルを開けるようにする

" 見た目の設定
set title                     " タイトルを表示
set number                    " 行番号を表示
set cursorline                " カーソル行をハイライト
set showcmd                   " コマンドの途中結果を表示
set wildmenu                  " コマンド補完の表示を強化
set showmatch                 " 対応する括弧を強調
syntax on                     " シンタックスハイライトを有効化
set background=dark           " ダークテーマに合わせたハイライト

" インデントの設定
set autoindent                " 自動インデント
set smartindent               " スマートインデント
set tabstop=4                 " タブ幅を4スペースに設定
set shiftwidth=4              " 自動インデントでのスペース幅を4に設定
set expandtab                 " タブをスペースに変換

" 検索の設定
set wrapscan                  " 検索時に最後まで行ったら最初に戻る
set hlsearch                  " 検索時に一致部分をハイライト
set incsearch                 " インクリメンタル検索
set ignorecase                " 大文字小文字を無視して検索
set smartcase                 " 大文字を含む場合は大文字小文字を区別

" ナビゲーションの設定
set scrolloff=4               " カーソル周辺に常に8行分の余白を表示
set sidescrolloff=4           " 横スクロール時にも余白を表示

" ファイル管理
set autoread                  " 編集中のファイルが変更されたら自動で読み直す
set undofile                  " ファイルごとに undo 履歴を保存
set noswapfile                " スワップファイルを作成しない
set nobackup                  " バックアップファイルを作成しない
set noundofile                " アンドゥファイルを作成しない

" キーマッピング
vnoremap < <gv                " ビジュアルモードで左にインデント後に再選択
vnoremap > >gv                " ビジュアルモードで右にインデント後に再選択
