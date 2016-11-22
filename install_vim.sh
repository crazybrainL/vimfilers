#!/usr/bin/env bash

CURRENT_PATH=`pwd`

## remove the previous link
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc

## Link dictionay and files
ln -s $CURRENT_PATH ~/.vim
ln -s $CURRENT_PATH/vimrc ~/.vimrc 


## Install vim-plug and all plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall


