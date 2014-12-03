" ============
" Vundle setup
" ============

set nocompatible

" workaround for vim 7.2 on os X, see:
" https://github.com/gmarik/vundle/wiki
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'The-NERD-tree'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'scrooloose/syntastic'

filetype plugin indent on


" ==========
" Vim config
" ==========

syntax on
colorscheme zenburn
set t_Co=256

" make backspace work in vim 7.4
set backspace=2

" fixes long timeout when opening a line above with:
" <ESC> <SHIFT> + o
" http://code.google.com/p/vim/issues/detail?id=24
set timeout timeoutlen=200 ttimeoutlen=100

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Highlight lines longer thatn 79 characters
"match Error /\%81v.\+/

" This works in vim 7.3+
set colorcolumn=80

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

if has("autocmd")
  autocmd FileType javascript setlocal tabstop=4
  autocmd FileType javascript setlocal shiftwidth=4
  autocmd FileType javascript setlocal softtabstop=4
endif

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Search and replace with confirmation
map 'r :%s/<C-r><C-w>//gc<Left><Left><Left>

" Remove whitespace
map 'R :%s/\s\+$\\| \+\ze\t//g<CR>

" Toggle paste mode
map 'i :set paste<CR>i

" Always disable paste mode when leaving insert mode
au InsertLeave * :set nopaste

" Proper RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby

" Unmap stupid man page lookup
map K <nop>

:command WQ wq
:command Wq wq
:command W w
:command Q q


" ===========
" vimbits.com
" ===========

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!

" Better comand-line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j


" =============
" Plugin config
" =============

" NERDTree
let NERDTreeQuitOnOpen=1
map \ :NERDTreeToggle<CR>
" show current file in nerdtree
map <silent> <bar> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" fugitive
map 'b :Gblame<CR>
map 'd :Gdiff<CR>
map 's :Gstatus<CR>

" Powerline
set laststatus=2
let Powerline_symbols="unicode"

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

nnoremap <C-f> :Ag<SPACE>

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0           " Scan all files for search
let g:ctrlp_clear_cache_on_exit = 0 " Cross-session caching
let g:ctrlp_show_hidden = 1         " Include hidden files & folders

" Faster syntax highlighting
syntax sync minlines=200

let g:syntastic_ruby_checkers = ['rubocop']
