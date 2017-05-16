#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Package list
packages=(
    bower
    grip
    gulp
    eslint
    csslint
    jshint
    jsonlint
)

# Install package globally
echo -e "${GREEN}Install Npm package (bower, gulp, eslint, jshint, grip)${NC}"
npm install -g "${packages[@]}"

echo -e "${GREEN}\nInstalling refined(pure) zsh's theme...${NC}"
npm install --global pure-prompt
