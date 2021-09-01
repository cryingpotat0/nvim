" Buffer scroll keep the mapping 'like' C-n and C-o
" nnoremap <tab> :bn<cr> " overwrites C-i
nnoremap <s-tab> :bp<cr> 

" Save control
nnoremap <Leader>q :wq<cr>
nnoremap <Leader>w :w<cr>

" Use alt + hjkl to resize windows
if has('macunix')
    nnoremap ∆  :resize +2<CR>
    nnoremap ˚  :resize -2<CR>
    nnoremap ˙  :vertical resize -2<CR>
    nnoremap ¬  :vertical resize +2<CR>
else
    nnoremap <M-j>    :resize +2<CR>
    nnoremap <M-k>    :resize -2<CR>
    nnoremap <M-h>    :vertical resize -2<CR>
    nnoremap <M-l>    :vertical resize +2<CR>
endif

" Clear other buffers
nnoremap <leader>l :only<cr>

" Insert newlines without going into insert mode
nnoremap <leader>O O<Esc>
nnoremap <leader>o o<Esc>

" Better tabbing: " Just use >. to replicate this, no need to have a command
" to remain in visual mode
"vnoremap < <gv 
"vnoremap > >gv

" Better window navigation
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-l> :wincmd l<cr>

" Search highlighting
nnoremap <Leader><space> :noh<cr>

" Move lines up and down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Quickfix helpers.
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>cc :cclose<CR>
