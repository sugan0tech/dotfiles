# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k Config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Environment Variables
[ -f "/Users/sugavanesh/.ghcup/env" ] && . "/Users/sugavanesh/.ghcup/env"
export PATH="$PATH:/Users/sugavanesh/.dotnet/tools"

# Terraform Autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

## Vim Mode & Navigation

# Enable Vim mode
bindkey -v

# Change cursor shape (block for Normal, line for Insert)
export KEYTIMEOUT=1
function zle-keymap-select {
    if [[ $KEYMAP == vicmd ]]; then
        echo -ne "\e[1 q"
    else
        echo -ne "\e[5 q"
    fi
}
zle -N zle-keymap-select

# Vim-style keybindings
bindkey -M vicmd 'h' backward-char
bindkey -M vicmd 'l' forward-char
bindkey -M vicmd 'w' forward-word
bindkey -M vicmd 'b' backward-word
bindkey -M vicmd '0' beginning-of-line
bindkey -M vicmd '^' beginning-of-line
bindkey -M vicmd '$' end-of-line
bindkey -M vicmd 'd' delete-char
bindkey -M vicmd 'dw' delete-word
bindkey -M vicmd 'dd' kill-whole-line
bindkey -M vicmd 'p' insert-last-word
bindkey -M vicmd 'u' undo
bindkey -M vicmd 'k' up-line-or-history
bindkey -M vicmd 'j' down-line-or-history

# Open command in Vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

## Fuzzy Finder (Ctrl+R)

export FZF_DEFAULT_OPTS="--height=40% --border --reverse --inline-info"
export FZF_CTRL_R_OPTS="--preview='echo {}' --preview-window=up:5:wrap"

# Bind fuzzy history search
bindkey '^r' fzf-history-widget

## Syntax Highlighting & Autosuggestions

# Enable syntax highlighting & autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## Improved 'cd' with Zoxide

eval "$(zoxide init zsh)"
alias cd='z'

## Better ls using eza

alias ls='eza --icons --color=auto'
alias ll='eza -lh --icons'
alias la='eza -lha --icons'
