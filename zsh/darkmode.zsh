#autoload
function alacritty-theme() {
    local theme="solarized_${1}"
    # sed doesn't like symlinks, so uh, should use realpath but whatever 
    local config_path="/Users/vadim/Dropbox/Mackup/.config/alacritty/alacritty.toml" # ~/.config/alacritty/alacritty.toml"
    local vim_local_path="/Users/vadim/.vimrc.local"

    sed -i "" -e "s#~/.config/alacritty/.*.toml#~/.config/alacritty/$theme.toml#g" $config_path
    sed -i "" -e "s#^set background=.*#set background=${1}#g" $vim_local_path
} 

function change_background() {
    local mode_setting="$1"
    # change background to the given mode. If mode is missing, 
    # we try to deduct it from the system settings.

    local mode="dark" # default value

    if defaults read -g AppleInterfaceStyle &> /dev/null
    then
        mode="dark"
    fi

    # change tmux
    case $mode in
        dark) tmux source-file ~/.dotfiles/tmux-statusline-dark.conf;;
        light) tmux source-file ~/.dotfiles/tmux-statusline-light.conf;;
    esac

    # change alacritty
    case $mode in
        dark) alacritty-theme dark;;
        light) alacritty-theme light;;
    esac
}

change_background
