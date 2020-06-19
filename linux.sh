#!/usr/bin/env bash

sudo pacman -S zsh
sudo pacman -S diff-so-fancy

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
