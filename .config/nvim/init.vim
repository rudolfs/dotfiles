call plug#begin('~/dotfiles/.config/nvim/plugged')
Plug 'jnurmine/Zenburn'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/syntastic'
Plug 'rainerborene/vim-reek'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" ==========
" Vim config
" ==========

syntax on
set mouse-=a
set termguicolors
colorscheme zenburn

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

set colorcolumn=80

set expandtab
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2

" .js specific tabs
if has("autocmd")
  autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4
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

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Airline
let g:airline_theme='zenburn'
nnoremap <C-f> :Ag<SPACE>

" Faster syntax highlighting
syntax sync minlines=200

let g:syntastic_ruby_checkers = ['rubocop', 'tslint', 'reek']

nmap <C-P> :FZF<CR>
