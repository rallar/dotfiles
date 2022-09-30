# zshrc gets called for non login shells
echo ".zshrc called for non login shells"

# add own path
export PATH="$PATH:/Users/ralf/bin:/opt/metasploit-framework/bin/"

# Variables
export ZSH=$HOME/.zsh

# alias
alias l='ls -AlhGF'
alias ll='ls -lhG'
alias ld='ls -ldGh  */'
alias c=clear
alias h=history

#force_color_prompt=yes
#prompt_symbol=㉿
prompt_symbol=💀
# Skull emoji for root terminal
[ "$EUID" -eq 0 ] && prompt_symbol=💀
PROMPT=$'%F{%(#.blue.green)}┌──(%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
unset prompt_symbol

setopt autocd              # change directory just by typing its name

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt share_history        
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups  

# tab completion and incasesensitive
autoload -U compinit && compinit
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# vi style bash
# set -o vi
# configure key keybindings
bindkey -v                                        # vim key bindings
bindkey ' ' magic-space                           # do history expansion on space

# force zsh to show the complete history
alias history="history 0"


# Plugins 
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
