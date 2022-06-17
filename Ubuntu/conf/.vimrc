
" -----------------------------------------------------------------------------
"  Vundle
" -----------------------------------------------------------------------------
" set the runtime path to include Vundle and intialize
set nocompatible    " be iMproved, requried
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" here you add the what plugin to install
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mcchrish/nnn.vim'                  " nnn
Plugin 'pangloss/vim-javascript'           " JavaScript support
Plugin 'leafgarland/typescript-vim'        " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'          " JS and JSX syntax
Plugin 'jparise/vim-graphql'               " GraphQL syntax
Plugin 'vlime/vlime', {'rtp': 'vim/'}      " SBCL 
Plugin 'nbouscal/vim-stylish-haskell'      " Stylish Haskell
Plugin 'purescript-contrib/purescript-vim' " purescript
Plugin 'vmchale/dhall-vim'                 " dhall extension
" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" All of Plugins must be added before the following line
call vundle#end()

filetype plugin on 
syntax enable
syntax on

" -----------------------------------------------------------------------------
" unmap default keys
nnoremap <C-a> <Nop>  " +1
nnoremap <C-x> <Nop>  " -1

" nomal mode key mapping
inoremap <C-w> <Esc>
inoremap <C-g> <Esc>
inoremap <C-x> <Esc>
nnoremap <C-s> :w<CR>
nnoremap <C-c> :q<CR>

highlight ColorColumn ctermbg=darkgrey
call matchadd('ColorColumn', '\%81v', 100)

" -----------------------------------------------------------------------------
" screen
set title
set ruler
set cursorline
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nowritebackup
set noswapfile
set nobackup
set nowrap
set number
set breakindent
set smartindent
set smartcase
set hlsearch
set incsearch
set showmatch
set shell=/bin/bash
set history=1000
set mouse=h

" -----------------------------------------------------------------------------
" Terminal                                                                   
nnoremap th :term<CR><C-w>H
nnoremap tj :term<CR><C-w>J
nnoremap tk :term<CR><C-w>K
nnoremap tl :term<CR><C-w>L
 
" -----------------------------------------------------------------------------
" NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" -----------------------------------------------------------------------------
" nnn custom mappings
nmap n3 :NnnPicker<CR>
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' }}
let g:nnn#action = {
    \ '<C-t>' : 'tab split',
    \ '<C-v>' : 'vsplit',
    \ '<C-h>' : 'split' }

" -----------------------------------------------------------------------------
"  stylish-haskell
set formatprg=stylish-haskell

" -----------------------------------------------------------------------------
" turn on buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

" -----------------------------------------------------------------------------
"  Lightling
let g:lightline = {
    \ 'colorscheme': 'powerlineish',
    \ 'active': {
    \     'left':  [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
    \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
    \ }
    \}


" -----------------------------------------------------------------------------
" Rust Language Server
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 
