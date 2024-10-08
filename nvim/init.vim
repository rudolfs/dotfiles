" Download and install vim-plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent! !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent! autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'cloudhead/neovim-fuzzy'
Plug 'cohama/lexima.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" Color themes
Plug 'jnurmine/zenburn'
Plug 'vim-airline/vim-airline-themes'
" Syntax highlighting
Plug 'cespare/vim-toml'
Plug 'evanleck/vim-svelte'
Plug 'fladson/vim-kitty'
Plug 'herringtondarkholme/yats.vim'
Plug 'neoclide/jsonc.vim' " Don't error on comments in JSON.
Plug 'rust-lang/rust.vim'
Plug 'tomlion/vim-solidity'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rudolfs/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Plugin configuration

" Telescope
nnoremap <C-g> <cmd>Telescope live_grep<cr>

" NERDTree
let NERDTreeQuitOnOpen=1
" Open NERDTree at the current file
map <silent> <bar> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" vim-fugitive
map 'b :Git blame<CR>

" Airline
let g:airline_theme = 'zenburn'
let g:airline_extensions = ['coc', 'searchcount', 'whitespace']
let g:airline_symbols = {}
let g:airline_symbols.colnr = ''
let g:airline_symbols.linenr = ' '
let g:airline_section_y = '' " hide file encoding
let g:airline_section_x = '' " hide filetype

" Fzy
nnoremap <C-p> :FuzzyOpen<CR>

" coc.vim
source ~/.config/nvim/coc.vim
let g:coc_global_extensions = ['coc-tsserver', 'coc-tslint-plugin', 'coc-rust-analyzer', 'coc-json', 'coc-prettier', 'coc-eslint']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
map 'p :Prettier<CR>
map 'a <Plug>(coc-codeaction-selected)l
nmap 't :<C-u>call CocActionAsync('doHover')<CR>
" Because coc floating windows sometimes stay open with ctrl+c
inoremap <C-c> <Esc>

" vim-highlightedyank
let g:highlightedyank_highlight_duration = 300

" Look & feel

silent! colorscheme zenburn
syntax on                 " syntax highlighting on by default
syntax sync minlines=200  " Faster syntax highlighting

set shortmess=atI         " don't show the intro message when starting Vim
set noshowmode            " don't show the current mode, let airline handle it
set termguicolors         " 24-bit color
set tabstop=2             " maximum width of an actual tab character
set shiftwidth=2          " size of an indent measured in spaces
set softtabstop=2         " number of spaces in TAB when editing
set expandtab             " tabs are spaces
set hlsearch              " highlight searches
set incsearch             " do incremental searching
set showmatch             " jump to matches when entering regexp
set ignorecase            " ignore case when searching
set smartcase             " no ignorecase if Uppercase char present
set visualbell t_vb=      " turn off error beep/flash
set novisualbell          " turn off visual bell
set autoindent            " copy indent from current line when starting new line
set colorcolumn=80        " show a visual guide for where the 80th char is
set mouse=                " disable mouse selection

au BufNewFile,BufRead *.rs setlocal colorcolumn=100

" Get rid of the green borders of the split divider
highlight VertSplit guibg=none
highlight VertSplit guifg=#627383

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

" Spacebar to clean unwanted search highlighting and clean up all coc floating
" windows
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>:call coc#float#close_all()<CR>

" Search and replace with confirmation
map 'r :%s/<C-r><C-w>//gc<Left><Left><Left>

" Remove whitespace
map 'R :%s/\s\+$\\| \+\ze\t//g<CR>

" Better comand-line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Simple line navigation
noremap j gj
noremap k gk

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight unwanted whitespace
highlight RedundantWhitespace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match RedundantWhitespace /\s\+$\| \+\ze\t/

" Spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!

highlight CocUnderline gui=undercurl
highlight CocErrorHighlight gui=undercurl
highlight CocWarningHighlight gui=undercurl
highlight SpellBad gui=undercurl

" Remove underline from TS object keys
highlight typescriptObjectLabel gui=bold
