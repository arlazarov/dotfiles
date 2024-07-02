export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="strug"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    web-search
    copypath
    copyfile
    copybuffer
    history
    JsonTools
    macos
    zsh-vi-mode
    z
    fzf
)

# Source plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# General Settings
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="false"
DISABLE_LS_COLORS="false"
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

# FZF Configuration
DISABLE_FZF_AUTO_COMPLETION="false"
DISABLE_FZF_KEY_BINDINGS="false"

# Neovim as default editor
export EDITOR=nvim
export VISUAL="$EDITOR"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Custom PATH additions
export PATH=$PATH:~/himalaya/target/release/
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

# Custom functions and aliases
function cd_up() {
  case $1 in
    *[!0-9]*)
      cd "$(pwd | sed -r "s|(.*/$1[^/]*/).*|\1|")"
      ;;
    *)
      cd "$(printf "%0.0s../" $(seq 1 $1))"
      ;;
  esac
}

alias ls="lsd"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fzf-tmux="fzf-tmux --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias f='fd --type f --hidden --exclude .git | fzf | xargs nvim'
alias fs='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'
alias 'cd..'='cd_up'

alias 'mail'='himalaya'
alias 'hotspot'='bash <(curl -s http://192.168.49.1:8181/msh)'

alias 'mongo_start'='brew services start mongodb/brew/mongodb-community@5.0'
alias 'mongo_stop'='brew services stop mongodb/brew/mongodb-community@5.0'
