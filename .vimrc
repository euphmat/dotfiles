set fenc=utf-8                       " 文字コード指定
set nobackup                         " バックアップファイル出力無効
set noswapfile                       " swpファイル出力無効
set noundofile                       " undoファイル出力無効
set autoread                         " 外部で変更があったときに読み直す
set showcmd
set encoding=utf8
set termencoding=utf8
set fileencodings=utf-8
set fileformats=unix,dos
set number
set smartindent
set showmatch
set tabstop=2
set expandtab
set hlsearch
set autoindent
set clipboard=unnamed,autoselect
syntax on

nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
