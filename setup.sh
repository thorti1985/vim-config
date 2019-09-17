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

# Create all required $VIM_DIR_FOLDERS
for DIR in $VIM_DIR_FOLDERS
do
    mkdir -p $VIM_DIR/${DIR}
done

# Copy individual filetype plugin to .vim/ftplugin
cp -r ftplugin .vim

# Download/Install "vim-plug" as plugin manager
curl -fLo $VIM_DIR_GITHUB/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Gruvbox is required because it is define in .vimrc. But whereas the other
# plugins are not required at executing the "PlugInstall" command, the "gruvbox"
# plugin blocks the command execution if it isn't available. Therefore it will
# downloaded "manually" directly from github.
git clone https://github.com/morhetz/gruvbox $VIM_DIR_GITHUB/plugged/gruvbox
vim +'PlugInstall' +'qa'

# Make symbolic links to the users $HOME directory
ln -s $VIM_DIR_GITHUB $VIM_DIR_USER
ln -s $VIMRC_GITHUB $VIMRC_USER
