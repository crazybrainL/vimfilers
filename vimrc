" whlin's vimrc
" zM: foldall
" General: {{{
" remapping the leader key
let mapleader = ","
" }}}
" Source_path_setting: {{{
if v:version >= 700
    source ~/.vim/vim/plugin.vim
    source ~/.vim/vim/macosx.vim
    source ~/.vim/vim/general.vim
endif 
" }}}
" GUI Setting: {{{
if v:version >= 700
    source ~/.vim/vim/gui.vim
endif 
" }}}

" vim: ft=vim foldmethod=marker foldcolumn=1 foldlevelstart=0

