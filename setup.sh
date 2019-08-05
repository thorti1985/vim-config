#!/bin/bash

# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
USER_HOME_DIR=~
CURRENT_DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_DIR=.vim
VIM_DIR_GITHUB=$CURRENT_DIR_OF_SCRIPT/$VIM_DIR
VIM_DIR_USER=$USER_HOME_DIR/$VIM_DIR
VIM_DIR_FOLDERS="autoload backup plugged tmp undo"
VIMRC=.vimrc
VIMRC_GITHUB=$CURRENT_DIR_OF_SCRIPT/$VIMRC
VIMRC_USER=$USER_HOME_DIR/$VIMRC

for DIR in $VIM_DIR_FOLDERS
do
    mkdir -p $VIM_DIR/${DIR}
done

curl -fLo $VIM_DIR_GITHUB/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/morhetz/gruvbox $VIM_DIR_GITHUB/plugged/gruvbox
ln -s $VIM_DIR_GITHUB $VIM_DIR_USER
ln -s $VIMRC_GITHUB $VIMRC_USER
vim +'PlugInstall' +'qa'
