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

set colorcolumn=80
highlight ColorColumn ctermbg=1 guibg=grey
