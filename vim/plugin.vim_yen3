if v:version >= 702

" Autocomplete Select: {{{
" 0: None
" 1: YoucompleteMe + UltiSnips
" 2: neocomplete + neosnippet
" 3: neocomplcache + neosnippet

" Default setting: no autocomplete 
let g:yen3_auto_complete_selet = 0

if has('nvim')
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

" Set automcomplete plugin combination manaually.
let g:yen3_auto_complete_selet = 1

" }}}
" Plugin: {{{
"" Let NeoBundle manage NeoBundle
if has('vim_starting')
  if !has('nvim')
      if &compatible
        set nocompatible               " Be iMproved
      endif
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"" Recommended to install
"" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundleLazy 'Shougo/vimshell.vim', { 'autoload' : {
      "\ 'commands' : 'VimShell'
      "\ }}
      "

"" unite.vim and plugins
NeoBundleLazy 'Shougo/unite.vim', { 'autoload' : {
      \ 'commands' : 'Unite'
      \ }}
NeoBundleLazy 'Shougo/neomru.vim', { 'autoload' : {
      \ 'unite_sources' : 'file_mru'
      \ }}
NeoBundleLazy 'tsukkee/unite-tag', { 'autoload' : {
      \ 'unite_sources' : 'tag'
      \ }}
NeoBundleLazy 'Shougo/unite-outline', { 'autoload' : {
      \ 'unite_sources' : 'outline'
      \ }}
NeoBundleLazy 'Shougo/unite-help', { 'autoload' : {
      \ 'unite_sources' : 'help'
      \ }}
NeoBundleLazy 'ujihisa/unite-launch', { 'autoload' : {
      \ 'unite_sources' : 'lanunch'
      \ }}
NeoBundleLazy 'thinca/vim-qfreplace', { 'autoload' : {
      \ 'unite_sources' : 'grep',
      \ }}
"NeoBundleLazy 'ujihisa/unite-locate', { 'autoload' : {
      "\ 'unite_sources' : 'locate',
      "\ }}
"NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {
      "\ 'unite_sources' : 'filetype',
      "\ }}
"NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : {
      "\ 'unite_sources' : 'history',
      "\ }}
"NeoBundleLazy 'Shougo/neobundle-vim-recipes', { 'autoload' : {
      "\ 'unite_sources' : 'neobundle',
      "\ }}

"" Edit
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundleLazy 'plasticboy/vim-markdown', { 'autoload' : {
      \ 'filetypes' : 'mkd'
      \ }}
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', { 'autoload' : {
      \ 'filetypes' : 'cpp'
      \ }}

NeoBundle 'google/vim-maktaba'
NeoBundle 'google/vim-codefmt'
NeoBundle 'google/vim-glaive'

"NeoBundleLazy 'Rykka/riv.vim', { 'autoload' : {
      "\ 'filetypes' : 'rst'
      "\ }}
"NeoBundleLazy 'mattn/emmet-vim', { 'autoload' : {
      "\ 'filetypes' : 'html'
      "\ }}
"NeoBundle 'Lokaltog/vim-easymotion'


"" Haskell
NeoBundleLazy 'ujihisa/neco-ghc', { 'autoload' : {
            \ 'filetypes' : 'haskell'
            \ }}
NeoBundleLazy 'ujihisa/repl.vim',  { 'autoload' : {
            \ 'filetypes' : 'haskell'
            \ }}
NeoBundleLazy 'eagletmt/ghcmod-vim',  { 'autoload' : {
            \ 'filetypes' : 'haskell'
            \ }}
"NeoBundleLazy 'raichoo/haskell-vim', {
            "\ 'filetypes': 'haskell'
            "\ }
"NeoBundleLazy 'lukerandall/haskellmode-vim', {
            "\ 'filetypes': 'haskell'
            "\ }
"NeoBundleLazy 'Twinside/vim-haskellConceal', {
            "\ 'filetypes': 'haskell'
            "\ }
"NeoBundleLazy 'frerich/unicode-haskell',  { 'autoload' : {
            "\ 'filetypes' : 'haskell'
            "\ }}
"NeoBundleLazy 'vim-scripts/haskell.vim', {
            "\ 'filetypes': 'haskell'
            "\ }

"" Python
NeoBundle 'klen/python-mode'
NeoBundle 'xitianfz/vim-python-syntax', { 'autoload' : {
            \ 'filetypes' : 'python'
            \ }}
"" Scala
NeoBundle 'derekwyatt/vim-scala', { 'autoload' : {
            \ 'filetypes' : 'scala'
            \ }}
NeoBundle 'derekwyatt/vim-sbt', { 'autoload' : {
            \ 'filetypes' : 'scala'
            \ }}

"" JavaScript
"NeoBundleLazy 'jelera/vim-javascript-syntax'
"NeoBundleLazy 'pangloss/vim-javascript'
"NeoBundle 'mxw/vim-jsx'

"" Rust
"NeoBundle 'rust-lang/rust.vim'

"" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', { 'autoload' : {
      \ 'commands' : 'Gitv'
      \ }}

"" Syntax check
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'Twinside/vim-cuteErrorMarker'

"" Apperance 
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
NeoBundle 'bling/vim-airline'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
"NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"NeoBundleLazy 'ap/vim-css-color', { 'autoload' : {
      "\ 'filetypes' : 'css'
      "\ }}
"NeoBundleLazy 'vim-scripts/DirDiff.vim', { 'autoload' : {
      "\  'commands': 'DirDiff' 
      "\ }}
      "
"" Autocomplete
if g:yen3_auto_complete_selet == 1
" Track the engine.
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'mac' : 'python install.py --clang-completer --system-libclang',
     \     'unix' : 'python install.py --clang-completer --system-libclang',
     \    }
     \ }

NeoBundle 'SirVer/ultisnips'

""" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'
endif

if g:yen3_auto_complete_selet == 2
NeoBundle 'Shougo/neocomplete'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'
endif

if g:yen3_auto_complete_selet == 3
NeoBundle 'Shougo/neocomplcache.vim'
endif

if g:yen3_auto_complete_selet == 2 || g:yen3_auto_complete_selet == 3
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
endif

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" }}}
" Autocomplete: {{{
if g:yen3_auto_complete_selet == 1
" UltiSnips :{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe: {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"mapping
nnoremap <leader>gs :YcmDiags<cr>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>
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

let g:unite_source_file_mru_long_limit = 10000
let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_long_limit = 10000 
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 20 

let g:unite_source_rec_max_cache_files = 10000

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_enable_use_short_source_names = 1

"" File search
noremap <silent><C-P> :Unite -start-insert file_rec/async buffer<CR>
noremap <silent><leader>p :UniteWithCursorWord -start-insert file_rec/async buffer<CR>
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
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 0
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

"" setting for javascript
let g:syntastic_javascript_checkers = ['eslint']

" }}}
" EasyMotion: {{{
"
let g:EasyMotion_leader_key = '\'
nnoremap <Leader>w <Plug>(easymotion-prefix)

" }}}
" ClangFormant: {{{
"let g:clang_format#style_options = {
            "\ "AccessModifierOffset" : -4,
            "\ "AlwaysBreakTemplateDeclarations" : "true",
            "\ "TabWidth" : 4,
            "\ "MaxEmptyLinesToKeep": 2,
            "\ "Standard" : "C++11"}


"" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" }}}
" Vim-cpp-enhanced-highlight: {{{
"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1
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
" Haskell-Vim: {{{
"let g:haskell_enable_quantification = 1 
"let g:haskell_enable_arrowsyntax = 1 
"let g:haskell_indent_where = 6
"let g:haskell_indent_do = 3
"let g:haskell_enable_pattern_synonyms = 1 
" }}}
" Vim-jsx: {{{
let g:jsx_ext_required = 0
" }}}

endif " if v:version >= 702

" vim: ft=vim foldmethod=marker foldcolumn=1
