#!/usr/bin/env bash

## Link dictionay and files

VIMFILERSHOME=~/Documents/vimfilers

if [[ ! -e $VIMFILERSHOME ]]; then
    git clone https://github.com/whlin/vimfilers $VIMFILERSHOME
fi

PATHS=($VIMFILERSHOME $VIMFILERSHOME/vimrc $VIMFILERSHOME/gvimrc)
LINKS=($HOME/.vim $HOME/.vimrc $HOME/.gvimrc)

tLen=${#PATHS[@]}

for (( i=0; i<${tLen}; i++ ));
do
    if [[ -e ${LINKS[$i]} ]]; then
        echo "rm -rf ${LINKS[$i]}"
        rm -rf ${LINKS[$i]}
    fi
    echo "ln -s ${PATHS[$i]} ${LINKS[$i]}"
    ln -s ${PATHS[$i]} ${LINKS[$i]}
done

if [[ -e ~/.bundle ]]; then
    echo "rm -rf ~/.bundle"
    rm -rf ~/.bundle
fi

if [[ -e $VIMFILERSHOME/bundle ]]; then
    echo "rm -rf $VIMFILERSHOME/bundle"
    rm -rf $VIMFILERSHOME/bundle
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
