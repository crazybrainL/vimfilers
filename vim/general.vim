" zM: fold all
" zR: unfold all

" Normal Mode Mapping: {{{
    " Page Control Keymapping: {{{
        nnoremap <C-K> <PageUp> 
        nnoremap <C-J> <PageDown> 
    " "}}}
" "}}}

" Insert Mode Mapping: {{{
    " Esc Keymapping: {{{
        "inoremap jk <esc>
        inoremap ;; <esc>
    " "}}}
    " Type Semicolon Keymapping: {{{
        inoremap ;<space> ;
    "" "}}}
    " Save File Keymapping: {{{
        "inoremap jkw <esc>:w<cr>
        inoremap ;w <esc>:w<cr>
    " "}}}
" "}}}

" General: {{{
"" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax enable
set t_Co=256            " 256 color mode
"set background=dark

color Tomorrow-Night-Bright

set ttyfast
set number

set autoread            " auto reload file when the file content is changed

set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside

filetype on             " Enable filetype detection
filetype plugin on      " Enable filetype-specific plugins
filetype indent on      " Enable filetype-specific indenting

"" status line
set laststatus=2

set title
set showmode            " Show current input mode in status line
set cursorline          " Show Cursor Line in Underline
"set showtabline=2
set wildmenu            " Show autocomplete menus.

" Disable bleep!
set visualbell
set noerrorbells

"" set column width
if v:version >= 704
set colorcolumn=80
endif

set nobackup
set noswapfile

" "}}}
" Set_encoding: {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double
" "}}}
" Disable_sound_on_errors: {{{
set noerrorbells
set novisualbell
set tm=500
" "}}}
" Search: {{{
set showcmd
set incsearch
set showmatch
set ignorecase
set smartcase

set hls

nnoremap <ESC>u :nohl<CR>
" "}}}
" Folding: {{{

""" set folding
set foldnestmax=2
set foldcolumn=2

set foldmethod=syntax
set foldlevel=99

"augroup foldccpp
    "au BufNewFile,BufFilePost,BufReadPost,FileReadPost *.c,*.h,*.cpp set foldmethod=syntax
    "au BufNewFile,BufFilePost,BufReadPost,FileReadPost *.c,*.h,*.cpp set foldlevel=99 
"augroup END

" "}}}
" Indent: {{{

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab            " insert tabs on the start of a line according to context
set backspace=indent,eol,start

" indent key mapping
nnoremap <tab> v>
nnoremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" "}}}
" Function_key: {{{

nnoremap <silent><F1> :tab h<CR>
nnoremap <silent><F2> :VimFiler<CR>
"nnoremap <silent><F3> :VimFilerExplorer -winwidth=25<CR>
nmap <silent><F6> :CCTreeLoadDB cscope.out<CR>

autocmd FileType c,cpp nnoremap <silent><F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . && cscope -bR<CR>
autocmd FileType python nnoremap <silent><F5> :!ctags -R . && pycscope -R<CR>
" "}}}
" Windows_Resize: {{{

nnoremap + <C-w>> 

" "}}}
" Tab_setting: {{{

"" Tab_bar_color
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>te :tabedit<SPACE>
nnoremap <leader>tm :tabmove<SPACE>
nnoremap <leader>tk :tabclose<CR>
nnoremap <C-H> :tabprev<CR>
nnoremap <C-L> :tabnext<CR>

autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction

nnoremap tt :call SwitchLastUsedTab()<CR>

" "}}}
" Filetype: {{{
if v:version >= 704
    "" C/ CPP with doxygen
    au BufNewFile,BufRead *.c set filetype=c.cpp.doxygen
    au BufNewFile,BufRead *.cpp set filetype=cpp.doxygen
    au BufNewFile,BufRead *.h set filetype=c.cpp.doxygen

    "" Markdown
    au BufNewFile,BufRead *.md set filetype=mkd.markdown
    au BufNewFile,BufRead *.mkd set filetype=mkd.markdown
    au BufNewFile,BufRead *.markdown set filetype=mkd.markdown

    "" JavaScript
    au BufNewFile,BufRead *.js set filetype=javascript.jsx
endif
" "}}}
" Programming: {{{

nnoremap <leader>m :make -j4<cr>
nnoremap <leader>n :make clean<cr>
nnoremap <leader>q :SQFix<cr>

com! -bang -nargs=? SQFix cal QFixToggle(<bang>0)
fu! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
        en
    endf

"" open the error console
nnoremap <leader>qc :botright cope<CR>
"map <C-n> <ESC>:cnext<CR>
"map <C-p> <ESC>:cprev<CR>

"nnoremap <S-F8> <ESC>:colder<CR>
"nnoremap <C-F8> <ESC>:cnewer<CR>

"" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

"" Auto remove each line-end space
autocmd FileType c,cpp,java,php,perl,python,haskell,markdown,mkd,ruby,sh,v,tex,scala autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","
")'))

" "}}}
" Auto Swith-Paste: {{{
" ref: http://blog.longwin.com.tw/2014/12/vim-linux-mac-putty-paste-mode-change-2014/
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
" }}}
" Todo List: {{{
function! CheckMarkdownTodoItem()
    let s = getline(line('.')) 
    if match(s, '\[x\]') > -1
        s/\[x\]/\[ \]/
        s/ (Finished: \(.* .*\))//
    elseif match(s, '\[ \]') > -1
        s/\[ \]/\[x\]/ 

        call cursor(line('.'), $)
        exe "normal! A (Finished: " . strftime("%a %Y-%m-%d") . " " . strftime("%T") .")\<Esc>"
    else
        echo "No Item"
    endif
endfunction

function! AddNewMarkdownToDo()
    exe "normal! o* [ ]  \<Esc>"
endfunction

autocmd FileType mkd noremap <leader>gc :call AddNewMarkdownToDo()<cr>
autocmd FileType mkd noremap <C-d>  :call CheckMarkdownTodoItem()<cr>
" "}}}

" vim: ft=vim foldmethod=marker foldcolumn=1 

"execute pathogen#infect()
