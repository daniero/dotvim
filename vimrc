
""""""""""""""""""
" FIRST OF ALL...
"

set nocompatible


""""""""""
" BUNDLES
"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'YankRing.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpared'
Plugin 'Raimondi/delimitMate'
Plugin 'msanders/snipmate.vim'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-ruby/vim-ruby'

call vundle#end() 


"""""""""""""""""
" STANDARD STUFF
"

filetype plugin indent on
syntax on

set number                " Display line numbers
set cursorline            " Highlight current line
set showcmd               
set hidden                " Allow hiding unsaved buffers
set history=1000          
set visualbell            " No beeps
set virtualedit=block     " Allow visual block to stretch beyond EOL

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

let mapleader="æ"

""" (Over)write read-only file
command! W w !sudo tee > /dev/null %

map <leader>e :new ~/.vimrc<CR>
map <leader>E :so ~/.vimrc<CR>

""" Switch ; and ,
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
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1
let g:pandoc_use_hard_wraps = 1
let g:pandoc_auto_format = 1
let g:EclimCompletionMethod = 'omnifunc'
let g:EasyMotion_leader_key = 'ø'

