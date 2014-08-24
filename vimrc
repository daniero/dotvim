
""""""""""""""""""
" FIRST OF ALL...
"

set nocompatible
call pathogen#infect()


"""""""""""""""""
" STANDARD STUFF
"

syntax on
filetype plugin indent on

set number
set cursorline
set showcmd
set hidden
set history=1000
set visualbell    " no beeps!

""" colors
if has('gui')
    colorscheme solarized
else
    colorscheme molokai
endif

""" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

""" Wrap text
set linebreak

""" search
set hlsearch
set incsearch
set ignorecase
set smartcase

""" status
set laststatus=2
let &statusline="%<%f %h%w%m%r%y %{fugitive#statusline()} %= L:%l/%L (%p%%) C:%c%V B:%o F:%{foldlevel('.')}"

""" folds
"set foldmethod=indent   " fold based on indent
"set foldnestmax=3       " deepest fold is 3 levels ...??!
set nofoldenable        " dont fold by default when opening new files

""" scrolling
set scrolloff=3         " Start scrolling when we're N lines away from margins
"set sidescrolloff=15
"set sidescroll=1


""""""""""""""""""""""""
" MAPPINGS OG KOMMANDOER
"

""" (Over)write read-only file
command! W w !sudo tee > /dev/null %

let mapleader="æ"
map <leader>e :new ~/.vimrc<CR>
map <leader>E :so ~/.vimrc<CR>

""" switch ; and ,
noremap , ;
noremap ; ,

map <F5> :NERDTreeToggle<CR>

""" Synced with apple keyboard prev/play/next buttons:
map <F8> :make<CR>
map <S-F8> :make clean<CR>
map <F7> :cprevious<CR>
map <F9> :cnext<CR>

""" Undoable CTRL-U in insert mode:
inoremap <C-u> <C-g>u<C-u>

""" general movement
noremap <C-s> %

""" Emacs(ish) style navigation in insert
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-t> <C-o>"qX<C-o>"qp
inoremap <C-l> <End>
inoremap <C-a> <Home>

""" <Enter> also calls :nohighlight
noremap <CR> :noh<CR><CR>

""" Underlining (TODO: finne felles "søppelregister")
map <leader>= yypv$r=
map <leader>- yypv$r-

function! ToggleBackgroundColour ()
    if (&background == 'light')
        set background=dark
        echo "background -> dark"
    else
        set background=light
        echo "background -> light"
    endif
endfunction
map <F6> :call ToggleBackgroundColour()<CR>


"""""""""""""""
" GUI SPECIFIC
"

if has("gui_running")
    set guioptions-=T   " Ta vekk verktøylinja! 
    set guioptions-=r   " Ta vekk rullefelt! 
    set guioptions-=L   " Ta vekk rullefelt (vertikale splits)! 
    set showtabline=0
endif 

""" Force enter normal mode when losing focus
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")


"""""""""""
" SPELLING
"

""" locally enable English spell and completion with :call Spell()
function! Spell()
    setlocal spell spelllang=en_us
    setlocal dictionary+=/usr/share/dict/words
    " word completion directly with ctrl+n/p:
    setlocal complete+=k
endfunction


"""""""""""""""""
" MISCELLANEOUS
"

""" move to ftplugin/pandoc.vim ??
augroup HiglightTODO
    autocmd!
    autocmd BufRead,BufNewFile *.md :silent! call matchadd('Todo', 'TODO\|XXX', -1)
augroup END


"""""""""""""""""""
" PLUGIN SETTINGS
"

let yankring_history_dir = expand('$HOME/.vim')
let snips_author = "Daniel Rødskog"
"let delimitMate_expand_cr = 1           " bruker ikke delimitMate lenger...
"let delimitMate_balance_matchpairs = 1  " bruker ikke delimitMate lenger...
let g:pandoc_use_hard_wraps = 1
let g:pandoc_auto_format = 1
let g:EclimCompletionMethod = 'omnifunc'
let g:EasyMotion_leader_key = 'ø'
