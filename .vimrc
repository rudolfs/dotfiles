" ============
" Vundle setup
" ============

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'Markdown'

filetype plugin indent on


" ==========
" Vim config
" ==========

syntax on
colorscheme zenburn
set t_Co=256

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Highlight lines longer thatn 79 characters
highlight OverLength ctermbg=darkgrey ctermfg=black
2match OverLength /\%80v.\+/

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

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
map 'p :set invpaste<CR>

" Proper RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby

" unmap stupid man page lookup
map K <nop>


" =============
" Plugin config
" =============

" NERDTree
map \ :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Buffer explorer
map <C-f> :FufCoverageFile<CR>
map <C-b> :FufBuffer<CR>
map <F1> :vert bo help<CR>

" fugitive
map 'b :Gblame<CR>
map 'd :Gdiff<CR>
map 's :Gstatus<CR>

" Powerline
set laststatus=2
let Powerline_symbols="unicode"
