setlocal makeprg=ant\ -emacs
"compiler ant

noremap <buffer> <s-k> :JavaDocPreview<CR><C-w>k

setlocal foldmethod=syntax
setlocal foldnestmax=2       " only fold classes and methods

