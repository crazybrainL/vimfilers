if v:version >= 702

" Autocomplete Select: {{{
" 0: None
" 1: YoucompleteMe + UltiSnips
" 2: neocomplete + neosnippet
" 3: neocomplcache + neosnippet
let g:yen3_auto_complete_selet =  0

if has('nvim')
" Select YouCompleteMe
let g:yen3_auto_complete_selet =  1
else
    if v:version >= 704
        if has("lua")
            let g:yen3_auto_complete_selet =  2
        else
            let g:yen3_auto_complete_selet =  3
        endif
    else
        let g:yen3_auto_complete_selet =  0
    endif
endif
" }}}
" Plugin: {{{
call plug#begin('~/.vim/plugged')

"" Recommended to install
"" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell.vim'

"" unite.vim and plugins
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-help'
Plug 'ujihisa/unite-launch'
Plug 'ujihisa/unite-locate'
"Plug 'osyo-manga/unite-filetype'
"Plug 'thinca/vim-unite-history'
"Plug 'Shougo/neobundle-vim-recipes'
"Plug 'thinca/vim-qfreplace'

Plug 'Shougo/vimfiler.vim'

"" Edit
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'michaeljsmith/vim-indent-object'
"Plug 'osyo-manga/vim-over'

Plug 'plasticboy/vim-markdown', {'for': ['mkd', 'markdown']}
Plug 'vim-scripts/DoxygenToolkit.vim', {'for': ['c', 'cpp', 'doxygen']} 
Plug 'Lokaltog/vim-easymotion'
"Plug 'Rykka/riv.vim', {'for': 'rst'}
"Plug 'mattn/emmet-vim', {'for': 'html'}

"" IDE 
Plug 'MarcWeber/vim-addon-mw-utils'

""" C/ C++
Plug 'simplyzhao/cscope_maps.vim', {'for': ['c', 'cpp']} 
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']} 
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']} 
Plug 'osyo-manga/vim-stargate'
"Plug 'vim-jp/cpp-vim', {'for': ['c', 'cpp']} 

""" Haskell
Plug 'vim-scripts/haskell.vim', {'for': 'haskell'} 
Plug 'ujihisa/neco-ghc', {'for': 'haskell'} 
Plug 'ujihisa/repl.vim', {'for': 'haskell'} 
"Plug 'Twinside/vim-haskellConceal', {'for': 'haskell'} 
"Plug 'lukerandall/haskellmode-vim', {'for': 'haskell'} 
"Plug 'frerich/unicode-haskell', {'for': 'haskell'} 

""" Python 
Plug 'klen/python-mode', {'for': 'python'} 
Plug 'xitianfz/vim-python-syntax', {'for': 'python'} 

"" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

"" Syntax check
Plug 'scrooloose/syntastic'

"" Apperance 
Plug 'bling/vim-airline'
Plug 'mkitt/tabline.vim'
"Plug 'ap/vim-css-color', {'for': 'css'}
"Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}

"" Autocomplete
if g:yen3_auto_complete_selet == 1
" Track the engine.
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh  --clang-completer' }
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
endif

if g:yen3_auto_complete_selet == 2
Plug 'Shougo/neocomplete'
Plug 'osyo-manga/vim-reunions'
Plug 'osyo-manga/vim-marching'
endif

if g:yen3_auto_complete_selet == 3
Plug 'Shougo/neocomplcache.vim'
endif

if g:yen3_auto_complete_selet == 2 || g:yen3_auto_complete_selet == 3
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
endif

call plug#end()

filetype plugin indent on

" }}}
" Autocomplete: {{{
if g:yen3_auto_complete_selet == 1
" UltiSnips :{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe: {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}
endif

if g:yen3_auto_complete_selet == 2
" Neocomplete: {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

"let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:neocomplete#enable_auto_close_preview = 1

" }}}
" Vim-marching:{{{
let g:marching_clang_command = "/usr/bin/clang"
let g:marching#clang_command#options = {
\   "cpp" : "-std=gnu++1y"
\}

let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"let g:marching_include_paths = filter(
    "\   split(glob('/usr/include/c++/*'), '\n') +
    "\   split(glob('/usr/include/*/c++/*'), '\n') +
    "\   split(glob('/usr/include/*/'), '\n'),
    "\   'isdirectory(v:val)')
let g:marching_include_paths = [
\ "/usr/local/include/c++/4.9.2",
\ "/usr/local/include/boost",
\ ] 

set updatetime=200

imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" }}}
endif

if g:yen3_auto_complete_selet == 3
" Neocomplcache: {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
endif

if g:yen3_auto_complete_selet == 2 || g:yen3_auto_complete_selet == 3
" Neosnippet: {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}
endif
" }}}
" Unite: {{{
let g:unite_enable_split_vertically = 1

let g:unite_source_file_mru_long_limit = 5000
let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_long_limit = 5000
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 20 

let g:unite_source_rec_max_cache_files = 5000

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_enable_use_short_source_names = 1

"" File search
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#custom#source("file_rec", "ignore_pattern", "build/*")
noremap <silent><C-P> :Unite -start-insert file_rec buffer<CR>
noremap <silent><leader>p :UniteWithCursorWord -start-insert file_rec buffer<CR>
noremap <silent><leader>b :Unite -start-insert buffer file_mru bookmark<CR>


"" shortcup
noremap <silent><leader>u  :<C-u>Unite -start-insert mapping<CR>

"" Execute help.
noremap <silent><leader>h  :Unite -start-insert -default-action=tabopen help<CR>

"" Tab search/ switch
noremap <silent><leader>t :Unite -quick-match tab<CR>


"" Tag search

""" For searching the word in the cursor in tag file 
"noremap <silent><leader>f :UniteWithCursorWord tag<CR>
"noremap <silent><leader>ff :Unite tag -start-insert -no-split<CR>

"" grep dictionay

""" For searching the word in the cursor in the current directory
noremap <silent><leader>s :UniteWithCursorWord grep:.<CR>
noremap <silent><leader>ss :Unite grep:.<CR>

""" For searching the word in the cursor in the current buffer
noremap <silent><leader>sf :UniteWithCursorWord grep:%<CR>

""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>sa :UniteWithCursorWord grep:$buffers<CR>

let g:unite_source_grep_default_opts = "-iRHn"
\ . " --exclude='tags'"
\ . " --exclude='cscope*'"
\ . " --exclude='*.svn*'"
\ . " --exclude='*.log*'"
\ . " --exclude='*tmp*'"
\ . " --exclude-dir='**/tmp'"
\ . " --exclude-dir='CVS'"
\ . " --exclude-dir='.svn'"
\ . " --exclude-dir='.git'"
\ . " --exclude-dir='node_modules'"

"" outline
nnoremap <leader>o :Unite -start-insert outline<CR>

"" Line search
nnoremap <leader>l :Unite line -start-insert -no-split<CR>

"" Yank history
"let g:unite_source_history_yank_enable = 1
"nnoremap <leader>y :<C-u>Unite -buffer-name=yank history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

nnoremap <silent> ;m :<C-u>Unite menu -resume<CR>

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.interpreter = {
      \     'interpreter' : 'Run interpreter in VimShell.',
      \ }
let g:unite_source_menu_menus.interpreter.command_candidates = {
      \       'ghci'         : 'VimShellInteractive ghci',
      \       'python'       : 'VimShellInteractive python',
      \    }
let g:unite_source_menu_menus.unite = {
      \     'description' : 'Start unite sources.',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = {
      \       'shortcut'        : 'Unite mapping',
      \       'help'            : 'Unite -start-insert -no-split -default-action=tabopen help',
      \       'history'         : 'Unite history/command',
      \       'quickfix'        : 'Unite qflist -no-quit',
      \       'resume'          : 'Unite -buffer-name=resume resume',
      \       'directory'       : 'Unite -buffer-name=files '.
      \             '-default-action=lcd directory_mru',
      \       'mapping'         : 'Unite mapping',
      \       'message'         : 'Unite output:message',
      \       'scriptnames'     : 'Unite output:scriptnames',
      \       'filetype'        : 'Unite -auto-preview filetype',
      \       'search plugin'   : 'Unite -no-split neobundle/search',
      \       'top'             : 'Unite process',
      \     }
let g:unite_source_menu_menus.enc = {
      \     'description' : 'Open with a specific character code again.',
      \ }
let g:unite_source_menu_menus.enc.command_candidates = [
      \       ['utf8', 'Utf8'],
      \       ['iso2022jp', 'Iso2022jp'],
      \       ['cp932', 'Cp932'],
      \       ['euc', 'Euc'],
      \       ['utf16', 'Utf16'],
      \       ['utf16-be', 'Utf16be'],
      \       ['jis', 'Jis'],
      \       ['sjis', 'Sjis'],
      \       ['unicode', 'Unicode'],
      \     ]
" }}}
" Airline: {{{
let g:airline_powerline_fonts = 0
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline#extensions#whitespace#enabled = 0 
" }}}
" VimFiler: {{{
let g:vimfiler_as_default_explorer = 1

if has("gui_macvim")
	" Like Textmate icons.
	let g:vimfiler_tree_leaf_icon = ' '
	let g:vimfiler_tree_opened_icon = '▾'
	let g:vimfiler_tree_closed_icon = '▸'
	let g:vimfiler_file_icon = '-'
	let g:vimfiler_marked_file_icon = '*'
endif

" }}}
" Markdown: {{{
let g:vim_markdown_folding_disabled=1
" }}}
" Doxygentoolkit: {{{

nnoremap <leader>d :Dox<CR> 

" }}}
" Pymode: {{{
"
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 1
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" }}}
" Syntastic: {{{

nnoremap <leader>e :Errors<CR>
nnoremap <Leader>ee :SyntasticToggleMode<CR>

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -I./inc'

" }}}
" EasyMotion: {{{
"
let g:EasyMotion_leader_key = '\'
nnoremap <Leader>w <Plug>(easymotion-prefix)

" }}}
" ClangFormant: {{{
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "TabWidth" : 4,
            \ "MaxEmptyLinesToKeep": 2,
            \ "Standard" : "C++11"}


" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" }}}
" Vim-cpp-enhanced-highlight: {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" }}}
" VimShell: {{{
let g:vimshell_prompt = "$ "
let g:vimshell_user_prompt = 'getcwd()'
" }}}
" Tabline: {{{
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
" }}}
endif

" vim: ft=vim foldmethod=marker foldcolumn=1
