# Aliases
alias memcache='memcached -m 256 -p 11211 -l 127.0.0.1 -d -u www && say memcached started'
alias ssh='TERM=screen ssh'
alias o='open'
alias oo='open .'

# Show/hide hidden files from finder
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
# alias photoshop='open -b "com.adobe.Photoshop"'
# alias plex='open -n -a "Google Chrome" --args "--app=http://127.0.0.1:32400/web/index.html"'

alias rmpyc="find . -name '*.pyc' -delete"

alias dc='docker-compose'
alias dcr='docker-compose run --rm web'


alias get="curl -O -L"
alias idk='pbcopy <<< "¯\_(ツ)_/¯"'
alias vi='vim'
alias im='vim'
alias vim=nvim

function notify() {
    local message="${1:-It is finished, whatever it is}";
    #reattach-to-user-namespace 
    terminal-notifier -sound default -message "${message}" 
}

# alias pydivio='~/.local/venvs/divio-cli/bin/divio'
alias pydivio='~/.local/pipx/venvs/divio-cli/bin/divio'
 
deploy() {
    local server="${1:-test}"
    local folder="`basename \`pwd\``"
    sleep 3 && divio app deploy ${server} && notify "deployed ${folder}" || notify "failed to deploy ${folder}"
}

if which bat >/dev/null 2>&1; then
    alias cat='bat --theme="Solarized (dark)"'
fi
