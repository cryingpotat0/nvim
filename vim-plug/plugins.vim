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
    Plug 'ayu-theme/ayu-vim' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
call plug#end()

" Vim-Go bug fix with folds
let g:go_fmt_experimental=1 

source $HOME/.config/nvim/vim-plug/commentary.vim
source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/vim-plug/colorscheme.vim
source $HOME/.config/nvim/vim-plug/coc.vim
source $HOME/.config/nvim/vim-plug/rooter.vim
source $HOME/.config/nvim/vim-plug/nerdtree.vim
source $HOME/.config/nvim/vim-plug/fugitive.vim

