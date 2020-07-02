#!/usr/bin/env bash

sudo pacman --noconfirm -S zsh exa tig

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chsh -s $(readlink -f $(which zsh)) $USER
