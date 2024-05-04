export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh/
export ZSH_THEME="vxsx"
export SOLARIZED_THEME=light

DISABLE_AUTO_TITLE=true
plugins=(git git-extras bower tmuxinator brew virtualenv npm)

export SVN_EDITOR=nvim
export EDITOR=nvim
export LC_ALL="en_US.UTF-8"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/.local/bin

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

source $ZSH/oh-my-zsh.sh

unsetopt BEEP


# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PRETTIERD_LOCAL_PRETTIER_ONLY=1
