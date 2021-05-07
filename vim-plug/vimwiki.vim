augroup WrapLineInWikiFile
    autocmd!
    autocmd FileType vimwiki setlocal wrap
augroup END

let wiki = {
    \ 'path': '~/vimwiki',
    \ 'path_html': '~/vimwiki/site_html/',
    \ 'template_path': '~/vimwiki/templates',
    \ 'custom_wiki2html': '/Users/ragz/.config/nvim/vim-plug/vimwiki-to-markdown.py',
    \ 'syntax': 'markdown',
    \ 'ext': '.md' }
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [wiki]
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/vim-plug/vimwiki-diary-template.py '%'

" Create a mapping on <leader>r<leader>r to create a new entry under
" reading/notes

nnoremap <leader>r<leader>r :py3 create_reading_note()<CR>

function! DefCreateReadingNote()
python3 << PYEND
import vim, datetime
def python_input(message = 'input'):
  vim.command('call inputsave()')
  vim.command("let user_input = input('" + message + ": ')")
  vim.command('call inputrestore()')
  return vim.eval('user_input')
  
template = \
"""
---
title: {title}
---

:insert-tags-here:

{date}

[Link]({url})

"""

def create_reading_note():
  curline = vim.current.line
  article_name = python_input('Enter title')
  url = python_input('Enter URL')
  article_name_lower = article_name.lower().replace(' ', '-')
  article_path = '/Users/ragz/vimwiki/reading/notes/{}.md'.format(article_name_lower)
  date = datetime.date.today().strftime('%a %d %b %Y')
  print(article_path)

  with open(article_path, 'w+') as f:
    f.write(template.format(title=article_name, date=date, url=url))


  with open('/Users/ragz/vimwiki/reading/index.md', 'a') as f:
    f.write('- [{}]("reading/notes/{}.md")'.format(article_name, article_name_lower))
  vim.command(':e ' + article_path)

PYEND
endfunction
:call DefCreateReadingNote()

