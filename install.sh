#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Bunch of symlinks
echo -e "${GREEN}\nProcessing symlinks...${NC}"
echo -e "${GREEN}----------------------${NC}"
ln -sfnv "$DOTFILES_DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sfnv "$DOTFILES_DIR/.config/nvim/init.vim" ~/.vimrc
ln -sfnv "$DOTFILES_DIR/.config/nvim/plugins.vim" ~/.config/nvim/plugins.vim
ln -sfnv "$DOTFILES_DIR/.config/nvim/plugins.vim" ~/.vim/plugins.vim
ln -sfnv "$DOTFILES_DIR/.config/nvim/colors" ~/.config/nvim/colors
ln -sfnv "$DOTFILES_DIR/.config/nvim/colors" ~/.vim/colors
ln -sfnv "$DOTFILES_DIR/.config/nvim/UltiSnips" ~/.config/nvim/UltiSnips
ln -sfnv "$DOTFILES_DIR/.config/nvim/UltiSnips" ~/.vim/UltiSnips
ln -sfnv "$DOTFILES_DIR/.aliases" ~
ln -sfnv "$DOTFILES_DIR/.exports" ~
ln -sfnv "$DOTFILES_DIR/.gitconfig" ~
ln -sfnv "$DOTFILES_DIR/.gitignore_global" ~
ln -sfnv "$DOTFILES_DIR/.tern-config" ~
ln -sfnv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfnv "$DOTFILES_DIR/.zshrc" ~

# Package managers & packages
echo -e "${GREEN}\nInstall required packages......${NC}"
echo -e "${GREEN}-------------------------------${NC}"
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/pip.sh"
. "$DOTFILES_DIR/install/npm.sh"

echo -e "${GREEN}\nConfiguring...${NC}"
echo -e "${GREEN}--------------${NC}"
. "$DOTFILES_DIR/install/configure.sh"

echo -e "${GREEN}\nDone! Enjoy :)${NC}"
