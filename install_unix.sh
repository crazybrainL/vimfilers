#!/usr/bin/env bash

## Link dictionay and files
PATHS=(`pwd` `pwd`/vimrc `pwd`/gvimrc)
LINKS=(~/.vim ~/.vimrc ~/.gvimrc)

tLen=${#PATHS[@]}

for (( i=0; i<${tLen}; i++ ));
do
    if [[ -e ${LINKS[$i]} ]]; then
        echo "rm ${LINKS[$i]}"
        rm ${LINKS[$i]}
    fi
    echo "ln -s ${PATHS[$i]} ${LINKS[$i]}"
    ln -s ${PATHS[$i]} ${LINKS[$i]}
done

if [[ ! -e ~/.bundle ]]; then
    mkdir ~/.bundle
else
    ls -A1 ~/.bundle | xargs rm -rf
fi

if [[ -e `pwd`/bundle ]]; then
    rm `pwd`/bundle
fi

ln -s ~/.bundle `pwd`/bundle

## Install Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

## Install all plugins
vim +NeoBundleInstall +qall

## make vimproc
cd ~/.vim/bundle/vimproc.vim && make

## install YouCompleteMe
#cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --gocode-completer --tern-completer
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py
