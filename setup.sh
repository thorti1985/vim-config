#!/bin/bash
set -x
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
USER_HOME_DIR=~
CURRENT_DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CDOS=$CURRENT_DIR_OF_SCRIPT
VIM_DIR=.vim
VIM_DIR_FOLDERS="autoload backup plugged tmp undo"
VIMRC=.vimrc

echo "pwd: $(pwd)"
echo "CURRENT_DIR_OF_SCRIPT: $CDOS"
# Create all required $VIM_DIR_FOLDERS
for DIR in $VIM_DIR_FOLDERS
do
    echo "mkdir -p $CDOS/$VIM_DIR/${DIR}"
    mkdir -p $CDOS/$VIM_DIR/${DIR}
done

# Copy individual filetype plugin to .vim/ftplugin
echo "Copy $CDOS/ftplugin/  to $CDOS/$VIM_DIR/ftplugin/"
cp -r $CDOS/ftplugin/ $CDOS/$VIM_DIR

# Download/Install "vim-plug" as plugin manager
curl -fLo $CDOS/$VIM_DIR/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Gruvbox is required because it is define in .vimrc. But whereas the other
# plugins are not required at executing the "PlugInstall" command, the "gruvbox"
# plugin blocks the command execution if it isn't available. Therefore it will
# downloaded "manually" directly from github.
git clone https://github.com/morhetz/gruvbox $CDOS/$VIM_DIR/plugged/gruvbox
vim +'PlugInstall' +'qa'

# Make symbolic links to the users $HOME directory
ln -s $CDOS/$VIM_DIR $USER_HOME_DIR/$VIM_DIR
ln -s $CDOS/$VIMRC $USER_HOME_DIR/$VIMRC
