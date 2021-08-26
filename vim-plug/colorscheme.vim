set termguicolors     " enable true colors support
let g:neon_style ="default"   " for dark version of theme
colorscheme neon

nnoremap <F2> :call CycleColor()<cr>

fun! CycleColor()
    let colors = ['default', 'light', 'dark']
    let i = index(colors, g:neon_style)
    let j = (i+1) % len(colors)
    let g:neon_style = colors[j]
    colorscheme neon
endfun

let g:colorcolumn_enabled = 1
set colorcolumn=100
highlight ColorColumn ctermbg=1 guibg=lightgrey

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

" Fix cursor color bug
set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20
