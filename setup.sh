#!/bin/bash
# Script-Name: setup.sh
# Owner: Thorsten Winkler
# Date: 24.03.2017
# Description: vim Setup
# Parameters: 


# Set the directory the script is stored in to make the script callable from anywhere
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Defines for better outputs
bold=`tput bold`
normal=`tput sgr0`

if [ -e ${DIR}/.installed ]; then
    echo "vim-config already done"
    exit 0
fi

echo "${bold}Setting up Symlinks...${normal}"
ln -sf -t ~/ ${DIR}/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc

echo "${bold}Creating tmp, backup and undo directories...${normal}"
mkdir -p ${DIR}/.vim/tmp
mkdir -p ${DIR}/.vim/backup
mkdir -p ${DIR}/.vim/undo

echo "${bold}Setting up Plugins${normal}"
REPOS=$(cat plugins)

# Make sure we've got the bundle directory
mkdir -p ${DIR}/.vim/bundle
cd ${DIR}/.vim/bundle/
INSTALLED_PLUGINS=$(ls -A)
for repo in $REPOS; do
    # Let's check if we've got the plugin installed already
    # (even though it shouldn't be the case since we're doing a fresh install - so..yea)
    found=0
    for plugin in $INSTALLED_PLUGINS; do
        if [[ $repo =~ /${plugin}.git ]]; then
            found=1
            break
        fi
    done

    if [ $found = 1 ]; then
        continue
    fi

    # Clone the repo of the plugin if it isn't installed yet
    git clone $repo
done

cd - > /dev/null 2>&1
touch .installed
echo "${bold}Done.${normal}"
