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
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
Plugin 'msanders/snipMate.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
"Plugin 'wincent/command-t'
Plugin 'vim-scripts/matchit.zip'
"Plugin 'terryma/vim-multiple-cursors'

""" Color schemes:
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

""" Filetype specific plugins:
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'mattn/emmet-vim'                     " html zencoding
Plugin 'rstacruz/sparkup'                     " html zencoding
Plugin 'vim-scripts/HTML-AutoCloseTag'        " html zencoding
Plugin 'groenewege/vim-less'                  " Less CSS
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'                 " Javascript
Plugin 'burnettk/vim-angular'
Plugin 'othree/html5.vim'
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
    colorscheme solarized "gruvbox solarized
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
" Takenover by Airline plugin
"let &statusline="%<%f %h%w%m%r%y %{fugitive#statusline()} %= L:%l/%L (%p%%) C:%c%V B:%o F:%{foldlevel('.')}"
set noshowmode

""" Folds
"set foldmethod=indent   " fold based on indent
"set foldnestmax=3       " deepest fold is 3 levels ...??!
set nofoldenable        " dont fold by default when opening new files

""" Scrolling
set scrolloff=3         " Start scrolling when we're N lines away from margins
"set sidescrolloff=15
"set sidescroll=1

""" Formatting
set formatoptions+=q    " Allow `gq` on comments


""""""""""""""""""""""""
" MAPPINGS OG KOMMANDOER
"

let mapleader=" "

""" Switch ; and ,
noremap , ;
noremap ; ,

""" Logical vertical movement in wrapped lines
nnoremap j gj
nnoremap k gk

""" Undoable CTRL-U in insert mode:
inoremap <C-u> <C-g>u<C-u>

""" general movement
map <C-s> %

""" Quick switch buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

""" Emacs(ish) style navigation in insert
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-t> <C-o>"-X<C-o>"-p
inoremap <C-a> <Home>
inoremap <C-l> <END>

""" Emacs(ish) style navigation on command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
"cnoremap <C-f>  <Right>
" TODO: make this one right;
"       <C-d> is useful for showing all options
"cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>
"cnoremap <Esc>d <S-right><Delete>

""" <Enter> also removes highlight and closes preview window
noremap <CR> :noh<CR>:pclose<CR><CR>

""" Substitute currently selected text
""" TODO: make better
vmap <Leader>s "py:<C-w>%s/<C-r>p//g<Left><Left>
""" Substitute last search phrase
nmap <Leader>s :%s/<C-r>///g<Left><Left>

""" Markdown/Pandoc header underlining
nmap <leader>= :+0 copy +0<CR>Vr=o<ESC>kk
nmap <leader>- :+0 copy +0<CR>Vr-o<ESC>kk

""" Synced with Apple keyboard prev/play/next buttons:
map <F8> :make<CR>
map <S-F8> :make clean<CR>
map <F7> :cprevious<CR>
map <F9> :cnext<CR>

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

nmap <leader>e :new ~/.vimrc<CR>
nmap <leader>E :so ~/.vimrc<CR>

""" (Over)write read-only file
command! W w !sudo tee > /dev/null %

map <F5> :NERDTreeToggle<CR>

""" Fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>


"""""""""""""""
" GUI SPECIFIC
"

if has("gui_running")
    " Font
    if empty(&guifont)
        " Makes {air/power}line look good
        silent! set guifont=Source\ Code\ Pro:h14
        " TODO fallback
        " TODO set alternative airline symbols
    endif

    " Look & feel
    set guioptions-=T   " Ta vekk verktøylinja! 
    set guioptions-=r   " Ta vekk rullefelt! 
    set guioptions-=L   " Ta vekk rullefelt (vertikale splits)! 
    set showtabline=0

    " Misc
    "set guioptions+=a   " Export selected text to clipboard
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
  au BufWritePost .vimrc,_vimrc,vimrc :source $MYVIMRC
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
let g:pandoc#formatting#mode = 'ha'
let g:EclimCompletionMethod = 'omnifunc'
let g:EasyMotion_leader_key = 'ø'
"let g:syntastic_check_on_open = 1
let g:ycm_auto_trigger = 0
let g:airline_detect_whitespace=0
let g:airline_powerline_fonts = 1
let g:bufferline_show_bufnr = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

set runtimepath+=~/.vim/bundle/snipMate.vim/after/

