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
    Plug 'vim-airline/vim-airline'
    " Plug 'rafamadriz/neon' 
    Plug 'Shatur/neovim-ayu'
    " " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'

    " Copilot
    Plug 'zbirenbaum/copilot.lua'
    Plug 'zbirenbaum/copilot-cmp'

    " LSP things
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    Plug 'simrat39/rust-tools.nvim'
    Plug 'jose-elias-alvarez/typescript.nvim'
    Plug 'sbdchd/neoformat'
    " Plug 'nvim-tree/nvim-web-devicons'
    " Plug 'folke/trouble.nvim'
    " Plug 'hrsh7th/nvim-compe'
    " Plug 'ldelossa/litee.nvim'
    " Plug 'ldelossa/litee-symboltree.nvim'

    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'nvim-treesitter/playground'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
    " Plug 'github/copilot.vim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    " Plug 'hrsh7th/cmp-copilot'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'


call plug#end()

" Vim-Go bug fix with folds
let g:go_fmt_experimental=1 

source $HOME/.config/nvim/vim-plug/commentary.vim
source $HOME/.config/nvim/vim-plug/lsp-config.vim
" source $HOME/.config/nvim/vim-plug/treesitter.vim
source $HOME/.config/nvim/vim-plug/nvim-compe.vim
source $HOME/.config/nvim/vim-plug/colorscheme.vim
source $HOME/.config/nvim/vim-plug/nerdtree.vim
source $HOME/.config/nvim/vim-plug/fugitive.vim
source $HOME/.config/nvim/vim-plug/telescope.vim


source $HOME/.config/nvim/vim-plug/copilot.vim
" source $HOME/.config/nvim/vim-plug/trouble.vim

" source $HOME/.config/nvim/vim-plug/coc.vim
" source $HOME/.config/nvim/vim-plug/rooter.vim
" source $HOME/.config/nvim/vim-plug/fzf.vim
