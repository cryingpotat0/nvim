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
    Plug 'airblade/vim-rooter'
    Plug 'vim-airline/vim-airline'
    Plug 'ayu-theme/ayu-vim' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

source $HOME/.config/nvim/vim-plug/commentary.vim
source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/vim-plug/colorscheme.vim
source $HOME/.config/nvim/vim-plug/coc.vim
source $HOME/.config/nvim/vim-plug/rooter.vim

