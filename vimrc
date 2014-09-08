""""""""""""""""""
" FIRST OF ALL...
"

set nocompatible


""""""""""
" PLUGINS
"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

""" General purpose plugins:
Plugin 'YankRing.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'Raimondi/delimitMate'
Plugin 'msanders/snipMate.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Valloric/YouCompleteMe'

""" Color schemes:
Plugin 'altercation/vim-colors-solarized'

""" Filetype specific plugins:
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'                 " Javascript
Plugin 'othree/html5.vim'
"Plugin 'mattn/emmet-vim'                     " html zencoding
Plugin 'rstacruz/sparkup'                     " html zencoding
Plugin 'vim-scripts/HTML-AutoCloseTag'        " html zencoding
Plugin 'vim-scripts/matchit.zip'              " html match pairs
Plugin 'derekwyatt/vim-scala'

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

""" Colors
if has('gui')
    colorscheme solarized
else
    colorscheme molokai
endif

""" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

""" Wrap text
set linebreak

""" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

""" Status
set laststatus=2
let &statusline="%<%f %h%w%m%r%y %{fugitive#statusline()} %= L:%l/%L (%p%%) C:%c%V B:%o F:%{foldlevel('.')}"

""" Folds
"set foldmethod=indent   " fold based on indent
"set foldnestmax=3       " deepest fold is 3 levels ...??!
set nofoldenable        " dont fold by default when opening new files

""" Scrolling
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

""" Markdown/Pandoc header underlining
map <leader>= :+0 copy +0<CR>Vr=o<ESC>kk
map <leader>- :+0 copy +0<CR>Vr-o<ESC>kk

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
    " Look & feel
    set guioptions-=T   " Ta vekk verktøylinja! 
    set guioptions-=r   " Ta vekk rullefelt! 
    set guioptions-=L   " Ta vekk rullefelt (vertikale splits)! 
    set showtabline=0

    " Misc
    set guioptions+=a
endif 

""" Force enter normal mode when losing focus
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")


"""""""""""
" SPELLING
"

""" Locally enable English spell and completion with :call Spell()
function! Spell()
    setlocal spell spelllang=en_us
    setlocal dictionary+=/usr/share/dict/words
    " Word completion directly with ctrl+n/p:
    setlocal complete+=k
endfunction


"""""""""""""""""
" MISCELLANEOUS
"

""" Automatically source .vimrc upon write
augroup vimrc_filetype
  autocmd!
  au BufWritePost ~/.vimrc :source %
augroup end

""" TODO Move to ftplugin/pandoc.vim ??
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
"let g:syntastic_check_on_open = 1
let g:ycm_auto_trigger = 0

set runtimepath+=~/.vim/bundle/snipMate.vim/after/
