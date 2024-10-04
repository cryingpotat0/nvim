set nocompatible
syntax on
set nowrap
set hidden
set encoding=utf8
set fileencoding=utf8

"Set correct python

let g:python3_host_prog = '~/.config/nvim/venv/bin/python'

"Set leader
let mapleader = ';'
let maplocalleader = ','

"Line Numbering
set number
set ruler
set rnu

"Set Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Folds
" set foldmethod=syntax
" set foldlevel=0 nomodeline

"Auxillary options
set smartindent            " Makes indenting smart
set autoindent             " Good auto indent
set indentexpr=
set laststatus=2           " Always display the status line
set cursorline             " Enable highlighting of the current line
set cmdheight=2            " More space for displaying messages
set formatoptions-=cro     " Stop newline continution of comments
set clipboard=unnamedplus  " Copy paste between vim and everything else
set smartcase
set incsearch
set mouse=a                " Enable your mouse
set splitbelow             " Horizontal splits will automatically be below
set splitright             " Vertical splits will automatically be to the right
set t_Co=256               " Support 256 colors
set formatoptions-=cro     " Stop newline continution of comments


au! BufWritePost $MYVIMRC source %      
" auto source when writing to init.vm alternatively you can run :source
" $MYVIMRC

hi BlackBg guibg=LightGreen
au TermOpen * :set winhighlight=Normal:BlackBg
