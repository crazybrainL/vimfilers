" OSX_Copy_Paste: {{{
if has('mac')
"" Copy & Paste Shortcut(s)
vmap ;y y:call system("pbcopy", getreg("\""))<CR>
vmap ;x x:call system("pbcopy", getreg("\""))<CR>
nmap ;p :call setreg("\"",system("pbpaste"))<CR>
endif
" }}}

" vim: ft=vim foldmethod=marker foldcolumn=1
