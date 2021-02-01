source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
if filereadable("~/.config/nvim/general/local.vim")
    source $HOME/.config/nvim/general/local.vim
endif
source $HOME/.config/nvim/general/overrides.vim
