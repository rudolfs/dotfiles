" Download and install vim-plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent! !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent! autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jnurmine/Zenburn'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'rainerborene/vim-reek'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jremmen/vim-ripgrep'
Plug 'darfink/vim-plist'
Plug 'nvie/vim-flake8'
call plug#end()


" Plugin configuration

" NERDTree
let NERDTreeQuitOnOpen=1
map \ :NERDTreeToggle<CR>
" Open NERDTree at the current file
map <silent> <bar> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" vim-fugitive
map 'b :Gblame<CR>

" ripgrep
set grepprg=rg
nnoremap <C-f> :Rg<SPACE>

" Airline
let g:airline_theme='zenburn'

" Syntastic
let g:syntastic_ruby_checkers=['rubocop', 'tslint', 'reek']
let g:syntastic_haskell_checkers=['hdevtools', 'hlint', 'ghc_mod']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_wq = 0

" Fuzzyfinder
nmap <C-P> :FZF<CR>


" Look & feel

silent! colorscheme zenburn
syntax on                 " syntax highlighting on by default
syntax sync minlines=200  " Faster syntax highlighting
let g:highlightedyank=300 " set yank highlight duration

set mouse-=a              " disable mouse
set shortmess=atI         " don't show the intro message when starting Vim
set noshowmode            " don't show the current mode, let airline handle it
set termguicolors         " 24-bit color
set colorcolumn=80        " show a visual guide for where the 80th char is
set tabstop=2             " maximum width of an actual tab character
set shiftwidth=2          " size of an indent measured in spaces
set softtabstop=2         " number of spaces in TAB when editing
set expandtab             " tabs are spaces
set autoindent            " copy indent from current line when starting new line
set hlsearch              " highlight searches
set incsearch             " do incremental searching
set showmatch             " jump to matches when entering regexp
set ignorecase            " ignore case when searching
set smartcase             " no ignorecase if Uppercase char present
set visualbell t_vb=      " turn off error beep/flash
set novisualbell          " turn off visual bell


" Custom key mappings

" Unmap stupid man page lookup
map K <nop>

" Remap common command typos
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reselect visual block after in/outdent
vnoremap < <gv
vnoremap > >gv

" Spacebar to clean unwanted search highlighting
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Search and replace with confirmation
map 'r :%s/<C-r><C-w>//gc<Left><Left><Left>

" Remove whitespace
map 'R :%s/\s\+$\\| \+\ze\t//g<CR>

" Better comand-line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j


" Misc

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Proper RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby

" Spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!
