# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add Homebrew bin directory to PATH for Apple Silicon Macs.
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="nano"
else
  export EDITOR="code"
fi

# Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh)
export ZSH="$HOME/.oh-my-zsh"
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  DISABLE_UPDATE_PROMPT="true"
  plugins=(git)
  source "$ZSH/oh-my-zsh.sh"
fi

# mint (https://github.com/yonaskolb/Mint)
export MINT_PATH="$HOME/.mint"
export MINT_LINK_PATH="$MINT_PATH/bin"

# zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
ZSH_AUTOSUGGESTIONS="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ ! -f "$ZSH_AUTOSUGGESTIONS" ]] || source "$ZSH_AUTOSUGGESTIONS"


# rbenv (https://github.com/rbenv/rbenv)
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

ZSH_MODULES="$HOME/.zsh"

# Aliases
[[ ! -f "$ZSH_MODULES/aliases.zsh" ]] || source "$ZSH_MODULES/aliases.zsh"

# Functions
[[ ! -f "$ZSH_MODULES/functions.zsh" ]] || source "$ZSH_MODULES/functions.zsh"

# Powerlevel10k (https://github.com/romkatv/powerlevel10k)
[[ ! -f "$ZSH_MODULES/p10k.zsh" ]] || source "$ZSH_MODULES/p10k.zsh"
