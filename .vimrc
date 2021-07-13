" ===================================================================
" 基本設定
" ===================================================================
set nocompatible                 " vi互換モードで起動しない
syntax enable                    " シンタックスハイライト
filetype plugin indent on        " ファイルタイプの検出
"set clipboard=unnamed,autoselect " クリップボード共有

" エンコード設定
set encoding=utf8                " エンコード指定
set termencoding=utf8            " エンコード指定
set fileencodings=utf-8          " 文字コード指定
set fileformats=unix,dos         " 改行コードの指定

" ファイル入出力設定
set nobackup                     " バックアップファイル出力無効
set noswapfile                   " swpファイル出力無効
set noundofile                   " undoファイル出力無効
set autoread                     " 外部で変更があったときに読み直す

" 検索設定
set incsearch                    " 一文字ずつ検索
set hlsearch                     " 検索文字をハイライト
set showmatch                    "

" タブ設定
set expandtab                    " タブでスペース文字を入力する
set tabstop=2                    " タブで入力するスペース文字の数
set smartindent                  " 自動インデント

" 表示設定
set number                       " 行番号の表示
set splitbelow                   "
set splitright                   "

" ===================================================================
" ステータスバー
" ===================================================================
set laststatus=2
highlight statusLine cterm=bold ctermfg=gray ctermbg=white
highlight statusLineNC cterm=bold ctermfg=darkgray ctermbg=darkgray
set showcmd                      " 右下に入力中コマンドを表示する

" ===================================================================
" キーコンフィグ
" ===================================================================

" ハイライト削除
noremap <ESC><ESC> :nohlsearch<CR><ESC>

" エスケープ
imap jj <Esc>
