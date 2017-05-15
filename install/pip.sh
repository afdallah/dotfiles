#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Add python support for noevim
echo -e "${GREEN}Add python support for neovim...${NC}"
sudo easy_install pip
pip2 install --user neovim

# Syntah highlighting for shell
echo -e "${GREEN}Install syntax highlighter for the shell...${NC}"
sudo easy_install Pygments
