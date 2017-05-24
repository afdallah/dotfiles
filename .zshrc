
# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME=""

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

for file in ~/.{exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
autoload -U promptinit; promptinit
prompt pure
unsetopt prompt_cr

# Enable vi editing mode in terminal

# Enable this create error inside tmux
# Show double path
set -o vi
VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select {
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
