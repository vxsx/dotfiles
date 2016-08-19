# Aliases
alias memcache='memcached -m 256 -p 11211 -l 127.0.0.1 -d -u www && say memcached started'
alias ssh='TERM=screen ssh'
alias o='open'
alias oo='open .'

# Show/hide hidden files from finder
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias photoshop='open -b "com.adobe.Photoshop"'

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

alias rmpyc="find . -name '*.pyc' -delete"
alias phantomjs-reset="rm -rf ~/Library/Application\ Support/Ofi\ Labs/PhantomJS/*"

alias docker-env='eval "$(docker-machine env default)"'
alias docker-start='docker-machine start default && docker-env'
alias docker-stop='docker-machine stop'
alias dc='docker-compose'
alias dm='docker-machine'
alias docker-kill-all='docker kill $(docker ps -q)'
alias dcr='docker-compose run --rm web'


alias idk='pbcopy <<< "¯\_(ツ)_/¯"'
