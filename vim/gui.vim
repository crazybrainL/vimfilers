" GUI_setting: {{{
if has('win32')
    set guifont=Source\ Code\ Pro:h16
else
    set guifont=Source\ Code\ Pro:h20
endif
set cursorline        " highlight current line
highlight SpellBad term=underline gui=undercurl guisp=Orange
" }}}
" vim: ft=vim foldmethod=marker foldcolumn=1
