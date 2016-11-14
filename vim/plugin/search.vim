if g:yen3_search_plugin_select == 1
" Unite: {{{
let g:unite_enable_split_vertically = 1

let g:unite_source_file_mru_long_limit = 100000
let g:unite_source_file_mru_time_format = "%m/%d %T "

let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_long_limit = 10000
let g:unite_source_directory_mru_time_format = "%m/%d %T "

let g:unite_source_file_rec_max_depth = 50

let g:unite_source_rec_max_cache_files = 100000

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_enable_use_short_source_names = 1

"" File search
if executable('ag')
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(\.Plo$\|\.lo$\|\.Po$\)')

noremap <silent><C-P> :Unite -start-insert file_rec/async -sync<CR>
noremap <silent><leader>p :UniteWithCursorWord -start-insert file_rec/async buffer<CR>
noremap <silent><leader>b :Unite -start-insert buffer file_mru bookmark<CR>

"" outline
nnoremap <leader>o :Unite -start-insert outline<CR>

"" Line search
"nnoremap <leader>l :Unite line -start-insert -no-split<CR>

"" shortcup
"noremap <silent><leader>u  :<C-u>Unite -start-insert mapping<CR>

"" Execute help.
"noremap <silent><leader>h  :Unite -start-insert -default-action=tabopen help<CR>

"" Tab search/ switch
"noremap <silent><leader>t :Unite -quick-match tab<CR>


" }}}
" Unite-Yank: {{{
"" yank history size
let g:neoyank#limit = 1000
nnoremap <leader>y :<C-u>Unite history/yank<cr>
" }}}
" Unite-Grep: {{{

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

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

""" For searching the word in the cursor in tag file
"noremap <silent><leader>f :UniteWithCursorWord tag<CR>
"noremap <silent><leader>ff :Unite tag -start-insert -no-split<CR>
"
""" For searching the word in the cursor in the current directory
noremap <silent><leader>s :UniteWithCursorWord grep:.<CR>
noremap <silent><leader>ss :Unite grep:.<CR>

""" For searching the word in the cursor in the current buffer
noremap <silent><leader>sf :UniteWithCursorWord grep:%<CR>

""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>sa :UniteWithCursorWord grep:$buffers<CR>

" unite grep use ag (http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" }}}
" Unite-Menu: {{{
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
elseif g:yen3_search_plugin_select == 2
" Fzf: {{{
autocmd VimEnter * command! Files
  \ call fzf#vim#files(<q-args>, {'left': '50%', 'options': '--reverse --prompt=""'})

autocmd VimEnter * command! Ag
  \ call fzf#vim#ag(<q-args>, {'left': '50%', 'options': '--reverse --prompt=""'})

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Label'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Keyword'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}
elseif g:yen3_search_plugin_select == 3
" Fzf: {{{
if has("gui_running") && has("mac")
let g:fzf_launcher = "/Users/yen3/.personal_scripts/fzf_macvim_start.sh %s"
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Function'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Function'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" key binding
autocmd VimEnter * command! Yen3Files
  \ call fzf#vim#files(<q-args>, {'left': '50%', 'options': '--reverse --prompt=""'})

autocmd VimEnter * command! Yen3Ag
  \ call fzf#vim#ag(<q-args>, {'left': '80%', 'options': '-e --reverse --prompt=""'})

autocmd VimEnter * command! Yen3AgCursorWord
  \ call fzf#vim#ag(<q-args>, {'left': '80%', 'options': '-e --reverse --prompt="" -q '. shellescape(expand('<cword>'))})

noremap <silent><C-P> :Yen3Files<CR>
noremap <silent><leader>s :Yen3Ag<CR>
noremap <silent><leader>ss :Yen3AgCursorWord<CR>
noremap <silent><leader>b :Buffers<CR>

" }}}
" Unite Outline: {{{
let g:unite_enable_split_vertically = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_use_short_source_names = 1
"" outline
nnoremap <leader>o :Unite -start-insert outline<CR>
" }}}
endif

" vim: ft=vim foldmethod=marker foldcolumn=1
