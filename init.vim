" Yen3's vimrc
" zM: foldall
" General: {{{
" remapping the leader key
let mapleader = ","
" }}}
" Source_path_setting: {{{
source ~/.vim/vim/plugin.vim
source ~/.vim/vim/general.vim
" }}}
" GUI Setting: {{{
source ~/.vim/vim/gui.vim
" }}}
if has('nvim')
set viminfo+=n~/.nvim/tmpfiles/viminfo
endif

" vim: ft=vim foldmethod=marker foldcolumn=1 foldlevelstart=0

