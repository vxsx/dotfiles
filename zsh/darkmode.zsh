#autoload
function alacritty-theme() {
    local theme="${1}"
    # sed doesn't like symlinks, so uh, should use realpath but whatever 
    local config_path="/Users/vadim/Dropbox/Mackup/.config/alacritty.yml" # ~/.config/alacritty.yml"

    sed -i "" -e "s#^colors: \*.*#colors: *$theme#g" $config_path
} 

function change_background() {
    local mode_setting="$1"
    # change background to the given mode. If mode is missing, 
    # we try to deduct it from the system settings.

    local mode="light" # default value

    if defaults read -g AppleInterfaceStyle &> /dev/null
    then
        mode="dark"
    fi

    # change tmux
    case $mode in
        dark) /usr/local/bin/tmux source-file ~/.dotfiles/tmux-statusline-dark.conf;;
        light) /usr/local/bin/tmux source-file ~/.dotfiles/tmux-statusline-light.conf;;
    esac

    # change alacritty
    case $mode in
        dark) alacritty-theme solarized_dark;;
        light) alacritty-theme solarized_light;;
    esac
}

change_background
