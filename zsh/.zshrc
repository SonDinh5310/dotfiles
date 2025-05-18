# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins to load
plugins=(fzf fzf-tab zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Shell integration
## Init zoxide
eval "$(zoxide init --cmd cd zsh)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls="eza"
alias ll="eza -la -h --icons=auto --group-directories-first --no-user"
alias cat="bat --color=always"
### Find & view content with fzf & bat
alias llc="fzf | xargs cat"
## Python
alias python=/usr/bin/python3
## Vscode
alias codego="code --profile go"
alias codereact="code --profile react"
## Git
### Find branch & checkout with fzf
alias gcb='git branch --color | fzf --preview "git show --color=always {-1}" \
                 --bind "enter:become(git checkout {-1})" \
                 --height 40% --layout reverse'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
## set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
## force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
## preview directory's content with ls when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a --color $realpath'
## switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Fix cursor
_fix_cursor() {
	echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
fpath+=${ZDOTDIR:-~}/.zsh_functions

# zsh autosuggestions setup
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# EXPORTS
## Golang setup
export GO111MODULE=on
export MOCKERY_PATH="/usr/bin/mockery"
export BAZEL_PATH="/usr/bin/bazel"
export JETBRAINS_TOOLBOX_PATH="$HOME/scripts"
# export GOROOT=$HOME/go
# export GOPATH=/usr/lib/go
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
# Export more path to app
# export PATH="$PATH:$MOCKERY_PATH:$BAZEL_PATH:$JETBRAINS_TOOLBOX_PATH"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude={.git,node_modules,.yarn,.next,dist,build,tmp}'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export XDG_CURRENT_DESKTOP="KDE"


export PATH="$PATH:$MOCKERY_PATH:$BAZEL_PATH:$JETBRAINS_TOOLBOX_PATH:$GOROOT/bin:$GOPATH/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
