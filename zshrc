# zshrc gets called for non login shells
# echo ".zshrc called for non login shells"
# show a fancy status screen at the top of a new shell
# config is in .config/neofetch/config.conf
# Only run neofetch in login shells to improve startup performance
[[ -o login ]] && neofetch

# add own path
# export PATH="$PATH:/Users/rallar/bin"

# Variables
export ZSH=$HOME/.zsh

# alias
alias l='ls -AlhF --color'
alias ll='ls -lhG --color'
alias ld='ls -ldh'
alias c=clear
alias h=history

alias vim=nvim

# prompt
#force_color_prompt=yes
if [[ "$OSTYPE" == "linux-gnu" ]]

then
    prompt_symbol=@
else
    prompt_symbol=💥    
fi


# Skull emoji for root terminal
[ "$EUID" -eq 0 ] && prompt_symbol=💀
PROMPT=$'%F{%(#.blue.green)}┌──(%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
unset prompt_symbol

setopt autocd              # change directory just by typing its name

## history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
# erase duplicate history entries
HISTDUP=erase
# append history
setopt appendhistory
# share the history in all terminals
setopt share_history        
# immediately append to the history file not just when a term is killed
setopt incappendhistory

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups  

# tab completion incasesensitive
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# vi style bash
set -o vi
# configure key keybindings
# vim key bindings (bash)
# bindkey -v
# do history expansion on space
bindkey ' ' magic-space

# force zsh to show the complete history
alias history="history 0"

# Plugins
# Load zsh-autosuggestions only if it exists
if [[ -f $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "Warning: zsh-autosuggestions not found at $ZSH/zsh-autosuggestions/"
  echo "Install with: git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/zsh-autosuggestions"
fi
