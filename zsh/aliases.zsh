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
alias plex='open -n -a "Google Chrome" --args "--app=http://127.0.0.1:32400/web/index.html"'

alias rmpyc="find . -name '*.pyc' -delete"
alias phantomjs-reset="rm -rf ~/Library/Application\ Support/Ofi\ Labs/PhantomJS/*"

alias docker-env='eval "$(docker-machine env default)"'
alias docker-start='docker-machine start default && docker-env'
alias docker-stop='docker-machine stop'
alias dc='docker-compose'
alias dm='docker-machine'
alias docker-kill-all='docker kill $(docker ps -q)'
alias dcr='docker-compose run --rm web'


alias get="curl -O -L"
alias idk='pbcopy <<< "¯\_(ツ)_/¯"'
alias vi='vim'
alias im='vim'

alias dps='divio project stop'
alias dpu='divio project up'
alias dpupd='divio project update'

alias mvim='open -a /Applications/MacVim.app'

function notify() {
    local message="${1:-It is finished, whatever it is}";
    #reattach-to-user-namespace 
    terminal-notifier -message "${message}" 
}

alias pydivio='~/.local/venvs/divio-cli/bin/divio'
