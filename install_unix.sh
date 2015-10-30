#!/usr/bin/env bash

## Link dictionay and files
rm ~/.vim    | ln -s `pwd` ~/.vim
rm ~/.vimrc  | ln -s `pwd`/vimrc ~/.vimrc 
rm ~/.gvimrc | ln -s `pwd`/gvimrc ~/.gvimrc 
rm -rf ~/.bundle & mkdir ~/.bundle & ln -s ~/.bundle `pwd`/bundle

## Install Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

## Install all plugins
vim +NeoBundleInstall +qall

## make vimproc
cd ~/.vim/bundle/vimproc.vim && make

## install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang --gocode-completer
