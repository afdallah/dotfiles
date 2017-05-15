#!/usr/bin/env bash

export RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -en "${GREEN}Install xcode command line tools (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
    xcode-select --install
else
    echo -e "\nSkipping xcode command line tools.\n"
fi

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew.sh` then `./brew.sh`
which -s brew
if [[ $? != 0 ]] ; then
    echo -e "${GREEN}Installing packages...${NC}\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "Brew already exist!\n"
    echo -e "Updating brew...\n"
    brew update
    brew upgrade
fi

# Programming Languages
echo -en "${GREEN}Install nodeJs (Y/n)? =>${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew install node
else
    echo -e "\nSkipping node.\n"
fi

# Dev Tools
echo -en "${GREEN}Install Dev tool kit (Y/n)? =>${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "${GREEN}Installing packages...\n${NC}"
    brew install git
    brew install wget
    brew cask install iterm2
    # brew install bash-completion2
    brew install vim --with-override-system-vi
    brew install neovim/neovim/neovim
    brew cask install macvim
    brew cask install visual-studio-code
    brew install tmux
    brew install reattach-to-user-namespace
    brew install tree
else
    echo -e "\nSkipping Developer tool kit.\n"
fi

# Markdown render
echo -en "${GREEN}Install qlmarkdown (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install qlmarkdown
else
    echo -e "\nSkipping qlmarkdown.\n"
fi

# Communication Apps
echo -en "${GREEN}Install Communication apps (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install franz
else
    echo -e "\nSkipping Communicaiton apps.\n"
fi

# Web Tools
echo -en "${GREEN}Install Chrome Browser (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install google-chrome
else
    echo -e "\nSkipping Chrome Browser.\n"
fi

# File Storage
echo -en "${GREEN}Install Google drive (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install google-drive
else
    echo -e "\nSkipping Google drive.\n"
fi

# Writing Apps
echo -en "${GREEN}Install Simplenote (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install simplenote
else
    echo -e "\nSkipping Simplenote.\n"
fi

# Entertainment
echo -en "${GREEN}Install Entertainment apps (Spotify) (Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install spotify
else
    echo -e "\nSkipping Entertainment apps.\n"
fi

# Others
echo -en "${GREEN}Install Misc Apps (spectacle, Zeplin)(Y/n)? => ${NC}"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    echo -e "Installing packages...\n"
    brew cask install spectacle
    brew cask install zeplin
else
    echo -e "\nSkipping Misc Apps.\n"
fi

# Remove oudtated cellar
echo -e "${GREEN}\nRemove all outdated cellar...${NC}"
brew cleanup
