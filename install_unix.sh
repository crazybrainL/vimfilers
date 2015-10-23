#!/usr/bin/env bash

## Link dictionay and files
ln -s `pwd` ~/.vim
ln -s `pwd`/vimrc ~/.vimrc 
ln -s `pwd`/gvimrc ~/.gvimrc 

## Install Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

## Install all plugins
vim +NeoBundleInstall +qall

## make vimproc
cd ~/.vim/bundle/vimproc.vim && make

## install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang 
