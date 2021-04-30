augroup WrapLineInWikiFile
    autocmd!
    autocmd FileType vimwiki setlocal wrap
augroup END

let wiki = {
	\ 'path': '~/vimwiki',
	\ 'template_path': '~/vimwiki/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/vimwiki/site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
    \ 'template_ext': '.tpl' }
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [wiki]
au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/.config/nvim/vim-plug/generate-vimwiki-diary-template.py '%'
