#!/usr/bin/env bash

## Link dictionay and files
VIMFILERSHOME=$HOME/Documents/vimfilers
PATHS=($VIMFILERSHOME $VIMFILERSHOME/vimrc $VIMFILERSHOME/gvimrc)
LINKS=($HOME/.vim $HOME/.vimrc $HOME/.gvimrc)

tLen=${#PATHS[@]}

cleanRCFiles (){
    # Remove Link
    for (( i=0; i<${tLen}; i++ ));
    do
        if [[ -e ${LINKS[$i]} ]]; then
            echo "rm -rf ${LINKS[$i]}"
            rm -rf ${LINKS[$i]}
        fi
    done
   
    if [[ -e $VIMFILERSHOME/bundle ]]; then
        echo "rm -rf $VIMFILERSHOME/bundle"
        rm -rf $VIMFILERSHOME/bundle
    fi
}

symlinkRCFiles (){
    for (( i=0; i<${tLen}; i++ ));
    do
        echo "ln -s ${PATHS[$i]} ${LINKS[$i]}"
        ln -s ${PATHS[$i]} ${LINKS[$i]}
    done
}

buildRCFiles (){
    
    if [[ -e $HOME/.bundle ]]; then
        echo "rm -rf $HOME/.bundle"
        rm -rf $HOME/.bundle
    fi
    
    mkdir $HOME/.bundle
    ln -s $HOME/.bundle $VIMFILERSHOME/bundle

    ## Install Neobundle
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

    ## Install all plugins
    vim +NeoBundleInstall +qall

    ## make vimproc
    cd $HOME/.vim/bundle/vimproc.vim && make

    ## install YouCompleteMe
    #cd $HOME/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --gocode-completer --tern-completer
    cd $HOME/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py
}

while getopts cs: opt
do
    case $opt in
        c) CLEAN=$OPTARG;;
        s) SYMLINK=$OPTARG;;
        \?) echo "Invalid option -$OPTARG" >&2;;
    esac
done

if [[ ! -e $VIMFILERSHOME ]]; then
    git clone https://github.com/whlin/vimfilers $VIMFILERSHOME
fi

echo "----- CLEAN -----"
cleanRCFiles

if [[ "${CLEAN}" != true ]]; then
    symlinkRCFiles
    if [[ "${SYMLINK}" != true ]];then
        echo "----- BUILD -----"
        #buildRCFiles
    fi
fi

