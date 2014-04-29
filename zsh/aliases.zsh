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
