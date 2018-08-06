export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh/
export ZSH_THEME="vxsx"
export SOLARIZED_THEME=light

DISABLE_AUTO_TITLE=true
plugins=(git git-extras bower tmuxinator fabric virtualenv sublime brew npm)

export SVN_EDITOR=vim
export EDITOR=vim
export LC_ALL="en_US.UTF-8"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/.local/bin

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

source $ZSH/oh-my-zsh.sh

. ~/.profile
. `brew --prefix`/etc/profile.d/z.sh

nvm use 8
