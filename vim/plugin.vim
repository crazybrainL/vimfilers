" Plugin Select: {{{
" Autocomplete Select: {{{
" 0: None
" 1: YoucompleteMe + UltiSnips  - for vim
" 2: neocomplete + neosnippeta  - for vim >= 7.4
" 3: deoplete.nvim + UltiSnips  - for nvim
let g:yen3_auto_complete_select = 1

" }}}
" Search Plugin Select: {{{
" 0: None
" 1: Unite
" 2: fzf
" 3: fzf + unite-outline
if has("gui_macvim")
let g:yen3_search_plugin_select = 1
else
let g:yen3_search_plugin_select = 3
endif
" }}}
" }}}
" Plugin: {{{
filetype plugin indent on

if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
call plug#begin('~/.vim/plugged')

"" Apperence
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'

" Generic
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/vimfiler.vim'
Plug 'sheerun/vim-polyglot'

"" Edit
Plug 'scrooloose/syntastic'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-sensible'
Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'michaeljsmith/vim-indent-object'
Plug 'plasticboy/vim-markdown', {'for': 'mkd'}
Plug 'vim-scripts/DoxygenToolkit.vim', {'for': 'cpp'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'rizzatti/dash.vim'

Plug 'vim-scripts/cscope.vim'

"" Haskell
Plug 'ujihisa/neco-ghc', {'for': 'haskell'}
Plug 'ujihisa/repl.vim', {'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'vim-scripts/haskell.vim', {'for': 'haskell'}

"" C/ Cpp
Plug 'rhysd/vim-clang-format', {'for': 'cpp'}

"" Python
Plug 'klen/python-mode', {'for': 'python'}
Plug 'xitianfz/vim-python-syntax', {'for': 'python'}
Plug 'nvie/vim-flake8',  {'for': 'python'}

"" Golang
Plug 'fatih/vim-go', {'for': 'go'}

"" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'junegunn/gv.vim', {'on': 'GV'}

"" Search {{{
if g:yen3_search_plugin_select== 1
""" Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'thinca/vim-unite-history'
Plug 'Shougo/unite-outline'

elseif g:yen3_search_plugin_select == 2
""" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

elseif g:yen3_search_plugin_select == 3
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

endif
" }}}
"" Autocomplete {{{
if g:yen3_auto_complete_select == 1
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'rdnetto/YCM-Generator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
endif

if g:yen3_auto_complete_select == 2
Plug 'Shougo/neocomplete'
Plug 'osyo-manga/vim-reunions'
Plug 'osyo-manga/vim-marching'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
endif

if g:yen3_auto_complete_select == 3
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
endif

" }}}

call plug#end()

" }}}
" Autocomplete: {{{
source ~/.vim/vim/plugin/autocomplete.vim
" }}}
" Search: {{{
source ~/.vim/vim/plugin/search.vim
" }}}
" Misc: {{{
source ~/.vim/vim/plugin/misc.vim
" }}}

" vim: ft=vim foldmethod=marker foldcolumn=1
