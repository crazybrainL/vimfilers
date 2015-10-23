if has("gui_macvim")
" TabShortCutSetting: {{{
    " switch between tabs with cmd+1, cmd+2,..."
    noremap <D-1> 1gt
    noremap <D-2> 2gt
    noremap <D-3> 3gt
    noremap <D-4> 4gt
    noremap <D-5> 5gt
    noremap <D-6> 6gt
    noremap <D-7> 7gt
    noremap <D-8> 8gt
    noremap <D-9> 9gt

    " until we have default MacVim shortcuts this is the only way to use it in
    " insert mode
    inoremap <D-1> <esc>1gt
    inoremap <D-2> <esc>2gt
    inoremap <D-3> <esc>3gt
    inoremap <D-4> <esc>4gt
    inoremap <D-5> <esc>5gt
    inoremap <D-6> <esc>6gt
    inoremap <D-7> <esc>7gt
    inoremap <D-8> <esc>8gt
    inoremap <D-9> <esc>9gt
" }}}

endif

" vim: ft=vim foldmethod=marker foldcolumn=1 foldlevelstart=0
