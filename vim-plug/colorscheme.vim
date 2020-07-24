set termguicolors     " enable true colors support
let g:ayucolor="mirage"   " for dark version of theme
colorscheme ayu

nnoremap <F2> :call CycleColor()<cr>

fun! CycleColor()
    let colors = ['light', 'dark', 'mirage']
    let i = index(colors, g:ayucolor)
    let j = (i+1) % len(colors)
    let g:ayucolor = colors[j]
    colorscheme ayu
endfun

let g:colorcolumn_enabled = 1
set colorcolumn=80
highlight ColorColumn ctermbg=1 guibg=lightgrey

nnoremap <F3> :call CycleColorColumn()<cr>
fun! CycleColorColumn()
    if g:colorcolumn_enabled == 0
        set colorcolumn=80
        highlight ColorColumn ctermbg=1 guibg=lightgrey
        let g:colorcolumn_enabled = 1
    else
        set colorcolumn=0
        let g:colorcolumn_enabled = 0
    endif
endfun
