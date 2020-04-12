" Download and install vim-plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent! !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent! autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'cloudhead/neovim-fuzzy'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'janko-m/vim-test'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'evanleck/vim-svelte'
call plug#end()

" Plugin configuration

" NERDTree
let NERDTreeQuitOnOpen=1
map \ :NERDTreeToggle<CR>
" Open NERDTree at the current file
map <silent> <bar> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" vim-fugitive
map 'b :Gblame<CR>

" Airline
let g:airline_theme='zenburn'
let g:airline#extensions#ale#enabled = 1

" Fzy
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-f> :FuzzyGrep<SPACE>

" deoplete
let g:python_host_prog = '/Users/rudolfs/.asdf/installs/python/2.7.10/bin/python'
let g:python3_host_prog = '/Users/rudolfs/.asdf/installs/python/3.7.2/bin/python'
let g:deoplete#enable_at_startup = 1

" vim-test
let test#strategy = 'neovim'
nmap <silent> 'tn :TestNearest<CR>
nmap <silent> 'tf :TestFile<CR>
nmap <silent> 'ts :TestSuite<CR>
nmap <silent> 'tl :TestLast<CR>
nmap <silent> 'tg :TestVisit<CR>


" Look & feel

silent! colorscheme zenburn
syntax on                 " syntax highlighting on by default
syntax sync minlines=200  " Faster syntax highlighting

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
let g:highlightedyank_highlight_duration = 300


" Custom key mappings

" Unmap stupid man page lookup
map K <nop>

" Convenience
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

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

" Exit terminal insert mode
tmap <C-[> <C-\><C-n>


" Misc

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match RedundantWhitespace /\s\+$\| \+\ze\t/

" Proper RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby

" Spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!


" Language specific stuff

au FileType go setlocal ts=4 sw=4 noexpandtab

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/usr/local/bin/reason-language-server']
    \ }
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
