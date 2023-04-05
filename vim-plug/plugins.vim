" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'airblade/vim-rooter'
    Plug 'vim-airline/vim-airline'
    " Plug 'ayu-theme/ayu-vim' 
    Plug 'rafamadriz/neon' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    " Plug 'stsewd/fzf-checkout.vim'
    " Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'vimwiki/vimwiki'
    Plug 'chipsenkbeil/distant.nvim', { 'tag': 'v0.2'}
    Plug 'github/copilot.vim'

call plug#end()

" Vim-Go bug fix with folds
let g:go_fmt_experimental=1 

source $HOME/.config/nvim/vim-plug/commentary.vim
" source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/vim-plug/colorscheme.vim
" source $HOME/.config/nvim/vim-plug/lsp-config.vim
source $HOME/.config/nvim/vim-plug/nvim-compe.vim
source $HOME/.config/nvim/vim-plug/treesitter.vim
source $HOME/.config/nvim/vim-plug/coc.vim
" source $HOME/.config/nvim/vim-plug/rooter.vim
source $HOME/.config/nvim/vim-plug/nerdtree.vim
source $HOME/.config/nvim/vim-plug/fugitive.vim
source $HOME/.config/nvim/vim-plug/vimwiki.vim
source $HOME/.config/nvim/vim-plug/telescope.vim


lua <<EOF
require('distant').setup {
      -- Applies Chip's personal settings to every machine you connect to
      --
      -- 1. Ensures that distant servers terminate with no connections
      -- 2. Provides navigation bindings for remote directories
      -- 3. Provides keybinding to jump into a remote file's parent directory
      ['*'] = require('distant.settings').chip_default()
    }
EOF
