#!/usr/bin/env bash

sudo pacman -S zsh
sudo pacman -S diff-so-pretty

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
