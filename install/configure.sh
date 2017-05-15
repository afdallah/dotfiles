#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Iterm colorscheme
echo -e "\n${GREEN}Installing colorscheme for Iterm2...${NC}"
open "${DOTFILES_DIR}/iterm/themes/base16-ocean.dark.256.itermcolors"

# Prepare everything for vim

# Install vim-plug (Vim package manager)
echo -e "${GREEN}\nInstalling Package manager for vim and neovim...${NC}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install tmux package manager (TPM)
echo -e "${GREEN}\nInstalling Package manager for tmux...${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# source TPM
tmux source ~/.tmux.conf

# Setup Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
echo -e "${GREEN}\nInstalling zsh${NC}"
brew install zsh zsh-completions

echo -e "${GREEN}\nSet zsh as default shell...${NC}"
chsh -s $(which zsh)

# echo -e "${GREEN}\nInstalling spaceship zsh's theme...${NC}"
# curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh

echo -e "${GREEN}\nInstalling history suggestions(zsh-autosuggestions)...${NC}"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions | zsh
