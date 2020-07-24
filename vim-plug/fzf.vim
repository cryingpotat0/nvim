" FZF Buffer Delete (https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813)
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" Fuzzy Search/ File find
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>h :Buffers<cr>

" Buffer delete
nnoremap <leader>H :BD<cr> 

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
