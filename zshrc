export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh/
export ZSH_THEME=""
export SOLARIZED_THEME=light

DISABLE_AUTO_TITLE=true
plugins=(git git-extras tmuxinator brew)

alias vim=nvim

export SVN_EDITOR=nvim
export EDITOR=nvim
export LC_ALL="en_US.UTF-8"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.local/bin

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH

source $ZSH/oh-my-zsh.sh

unsetopt BEEP

# Pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit

zstyle ':prompt:pure:path' color yellow
zstyle ':prompt:pure:git:branch' color blue
zstyle ':prompt:pure:prompt:*' color cyan
export PURE_PROMPT_SYMBOL='%%'

prompt pure
