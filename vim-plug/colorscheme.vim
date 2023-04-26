set termguicolors     " enable true colors support
lua <<EOF
vim.g.neon_style = "light"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = false
vim.g.neon_bold = true
vim.cmd[[colorscheme neon]]
EOF

let g:colorcolumn_enabled = 1
set colorcolumn=100

nnoremap <F3> :call CycleColorColumn()<cr>
fun! CycleColorColumn()
    if g:colorcolumn_enabled == 0
        set colorcolumn=100
        highlight ColorColumn ctermbg=1 guibg=lightgrey
        let g:colorcolumn_enabled = 1
    else
        set colorcolumn=0
        let g:colorcolumn_enabled = 0
    endif
endfun


