""" Jump to subject under cursor
nnoremap <buffer> <CR> <C-]>
""" Return from last jump
nnoremap <buffer> <BS> <C-T>
""" Next & Previous subject
nnoremap <buffer> <silent>s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> <silent>S ?\|\zs\S\+\ze\|<CR>
""" Next & Previous option
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
