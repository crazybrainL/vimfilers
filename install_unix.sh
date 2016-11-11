#!/usr/bin/env bash

## Link dictionay and files

VIMFILERSHOME=~/Documents/vimfilers

PATHS=($VIMFILERSHOME $VIMFILERSHOME/vimrc $VIMFILERSHOME/gvimrc)
LINKS=($HOME/.vim $HOME/.vimrc $HOME/.gvimrc)

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

if [[ -e ~/.bundle ]]; then
    rm -rf ~/.bundle
fi

if [[ -e $VIMFILERSHOME/bundle ]]; then
    rm $VIMFILERSHOME/bundle
fi

mkdir $HOME/.bundle
ln -s $HOME/.bundle $VIMFILERSHOME/bundle

## Install Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

## Install all plugins
vim +NeoBundleInstall +qall

## make vimproc
cd ~/.vim/bundle/vimproc.vim && make

## install YouCompleteMe
#cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --gocode-completer --tern-completer
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py
