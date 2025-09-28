# Powerlevel10k Instant Prompt — keep this at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh Framework (Oh My Zsh)
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# Remove this line — it causes your theme error
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Optional: Suppress Powerlevel10k instant prompt warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Autosuggestions & Syntax Highlighting (Use Arch Linux paths)
# If installed via pacman:
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Haskell setup (optional)
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# Path fixes
export PATH="$PATH:$HOME/.dotnet/tools"

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Vim Mode & Keybindings
bindkey -v
export KEYTIMEOUT=1
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne "\e[1 q"
  else
    echo -ne "\e[5 q"
  fi
}
zle -N zle-keymap-select

# Vi-mode navigation
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
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Fuzzy Finder
export FZF_DEFAULT_OPTS="--height=40% --border --reverse --inline-info"
export FZF_CTRL_R_OPTS="--preview='echo {}' --preview-window=up:5:wrap"

# If running on Arch Linux, load fzf bindings
if command -v pacman &>/dev/null && grep -qi 'arch' /etc/os-release; then
  [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
  bindkey '^r' fzf-history-widget
fi

bindkey '^r' fzf-history-widget

# Zoxide for better `cd`
eval "$(zoxide init zsh)"
alias cd='z'

# Better ls with eza
alias ls='eza --icons --color=auto'
alias ll='eza -lh --icons'
alias la='eza -lha --icons'

# Autosuggestions and Syntax Highlighting (Arch Linux system path)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
