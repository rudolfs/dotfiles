" Download and install vim-plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent! !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent! autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.config/nvim/coc.vim

call plug#begin('~/.local/share/nvim/plugged')
Plug 'cloudhead/neovim-fuzzy'
Plug 'cohama/lexima.vim'
Plug 'evanleck/vim-svelte'
Plug 'herringtondarkholme/yats.vim'
Plug 'jnurmine/zenburn'
Plug 'machakann/vim-highlightedyank'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomlion/vim-solidity'
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
let g:airline#extensions#scrollbar#enabled = 0

" Fzy
nnoremap <C-p> :FuzzyOpen<CR>

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

" Cause coc floating windows sometimes stay open with ctrl+c
inoremap <C-c> <Esc>

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
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>:call coc#util#float_hide()<CR>

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

" Spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!

" Make sure we dont' load the rust cargo plugin from rust.vim!
let g:loaded_rust_vim_plugin_cargo = 1
" Don't add errors to quickfix if rustfmt fails.
let g:rustfmt_fail_silently = 1
let g:rustfmt_autosave = 1
" coc.vim
function! SetupCoc()
  nmap <silent> gd           <Plug>(coc-definition)
  nmap <silent> gi           <Plug>(coc-implementation)
  nmap <silent> gr           <Plug>(coc-references)
  nmap <silent> <leader>/    :CocList --interactive symbols<CR>

  " This is a kind of hack to make <C-Y> not trigger snippet expansion.
  " We use <C-p><C-n> to insert the selection without triggering anything, and
  " then close the popup.
  inoremap <silent><expr> <C-Y> pumvisible() ? "<C-p><C-n><Esc>a" : "\<C-Y>"
endfunction
autocmd User CocNvimInit call SetupCoc()
let g:coc_global_extensions = ['coc-tsserver', 'coc-tslint-plugin', 'coc-svelte', 'coc-rust-analyzer', 'coc-json']

"
" Quickfix Signs
"
sign define quickfix-error text=× texthl=ErrorSign

command! QuickfixSigns call s:QuickfixSigns()

" autocmd BufWrite * sign unplace *
autocmd CursorHold *.rs silent QuickfixSigns

function! s:QuickfixSigns()
  silent! cgetfile
  sign unplace *
  for dict in getqflist()
    if dict.type != 'E'
      continue
    endif
    try
      silent exe "sign"
          \ "place"
          \ dict.lnum
          \ "line=" . string(dict.lnum)
          \ "name=" . "quickfix-error"
          \ "file=" . bufname(dict.bufnr)
    catch

    endtry
  endfor
endfunction


noremap j gj
noremap k gk
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
