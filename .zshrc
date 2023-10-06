# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions F-Sy-H)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"
alias nvimconfig="cd ~/.config/nvim && ${EDITOR} ~/.config/nvim"

# brew install eza
alias ls="eza -lah --icons --group-directories-first --git --no-time --git-repos"

EXA_COLORS=""
EXA_COLORS+="sn=38;5;29:sb=38;5;100:" # darker and better contrast for file size
EXA_COLORS+="uu=38;5;239:gu=38;5;239:"
EXA_COLORS+="ur=38;5;240:uw=38;5;244:ux=38;5;248:ue=38;5;248:" # user permissions
EXA_COLORS+="gr=38;5;240:gw=38;5;244:gx=38;5;248:" # group permissions
EXA_COLORS+="tr=38;5;240:tw=38;5;244:tx=38;5;248:" # other permissions
EXA_COLORS+="xa=38;5;24:" # xattr marker ('@')
EXA_COLORS+="xx=38;5;240:" # punctuation ('-')
export EXA_COLORS

# brew install trash-cli
alias rm="echo '\"rm\" not permited. Use \"tp\" instad'"
alias tp='trash-put -v --trash-dir ~/.Trash/'

alias vim="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

