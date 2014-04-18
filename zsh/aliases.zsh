# Aliases
alias memcache='memcached -m 256 -p 11211 -l 127.0.0.1 -d -u www && say memcached started'
alias ssh='TERM=screen ssh'
alias o='open'
alias oo='open .'
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
