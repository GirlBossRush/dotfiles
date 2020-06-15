#!/usr/bin/env bash

echo "Hello install.sh"

echo "Clonling home dotfiles..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for f in $(ls -d $DIR/home/.*); do ln -s $f $HOME; done

mkdir $HOME/.vim_backup
mkdir $HOME/.vim_swap


./linux.sh
