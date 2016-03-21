"新しい行のインデントを現在行と同じにする
"set autoindent
"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
"set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
"set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"""検索をファイルの先頭へループしない
""set nowrapscan
"バックアップを作成しない
set nobackup
set nowritebackup
" 画面末端からどのくらいのオフセットでスクロールするか
set scrolloff=5
" カーソル位置の表示
set cursorline

syntax on
set hlsearch

set backspace=indent,eol,start
set showmode

set laststatus=2

highlight ZenkakuSpace cterm=underline ctermfg=lightgreen guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,euc-jp

augroup filetypedetect
au! BufRead,BufNewFile *.tpl setfiletype php
augroup END
augroup filetypedetect
au! BufRead,BufNewFile *.inc setfiletype php
au! BufRead,BufNewFile *.html setfiletype php
au! BufRead,BufNewFile *.do setfiletype php
augroup END

set showcmd

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

" General colors
hi Cursor     guifg=NONE    guibg=#656565   gui=none
hi Normal     guifg=#f6f3e8 guibg=#242424   gui=none
hi NonText    guifg=#808080 guibg=#303030   gui=none
hi LineNr     guifg=#857b6f guibg=#000000   gui=none
hi StatusLine   guifg=#f6f3e8 guibg=#444444   gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444   gui=none
hi VertSplit  guifg=#444444 guibg=#444444   gui=none
hi Folded     guibg=#384048 guifg=#a0a8b0   gui=none
hi Title    guifg=#f6f3e8 guibg=NONE      gui=bold
"hi Visual   guifg=khaki   guibg=olivedrab gui=none
hi Visual   guifg=#444444   guibg=#444444 gui=none
hi SpecialKey guifg=#808080 guibg=#343434   gui=none

" Syntax highlighting
hi Comment    guifg=#99968b gui=italic
hi Todo     guifg=#8f8f8f gui=italic
hi Constant   guifg=#e5786d gui=none
hi String     guifg=#95e454 gui=italic
hi Identifier   guifg=#cae682 gui=none
hi Function   guifg=#cae682 gui=none
hi Type     guifg=#cae682 gui=none
hi Statement  guifg=#8ac6f2 gui=none
hi Keyword    guifg=#8ac6f2 gui=none
hi PreProc    guifg=#e5786d gui=none
hi Number   guifg=#e5786d gui=none
hi Special    guifg=#e7f6da gui=none

autocmd FileType * setlocal formatoptions-=ro
autocmd BufWritePre * :%s/\s\+$//ge

nnoremap <C-b> :cprevious<CR>   " 前へ
nnoremap <C-n> :cnext<CR>       " 次へ
"nnoremap <C-B> :<C-u>cfirst<CR> " 最初へ
"nnoremap <C-N> :<C-u>clast<CR>  " 最後へ

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on

" ホスト固有の設定ファイルがある場合読み込む
if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

