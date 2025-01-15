
" Using Lua functions
nnoremap <leader>F <cmd>lua require('fzf-lua').files()<cr>
nnoremap <leader>gg <cmd>lua require('fzf-lua').grep()<cr>
nnoremap <leader>gp <cmd>lua require('fzf-lua').grep_project()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }<cr>
" nnoremap <leader>fG <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>h <cmd>lua require('fzf-lua').buffers()<cr>
nnoremap <leader>gb <cmd>lua require('fzf-lua').git_branches({ pattern = 'refs/heads' })<cr>

