
# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Theme
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

#[--- Plugin Start ---]#
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Source .exports
source $HOME/.exports

#[--- Plugin End ---]#
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Enable vi editing mode in terminal
set -o vi

SPACESHIP_PROMPT_SYMBOL=⬢
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

for file in ~/.{exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
