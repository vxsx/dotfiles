export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh/
export ZSH_THEME="vxsx"
export SOLARIZED_THEME=light

DISABLE_AUTO_TITLE=true
plugins=(git tmuxinator)

source $ZSH/oh-my-zsh.sh

export SVN_EDITOR=vim
export EDITOR=vim
export LC_ALL="en_US.UTF-8"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Library/Python/2.7/bin

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/libexec/perl5.16/sitebin/:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
