#autoload

# Ensure homebrew binaries are available (launchd uses minimal PATH)
export PATH="/opt/homebrew/bin:$PATH"

function alacritty-theme() {
    local theme="${1}"
    local config_path="/Users/vadim/.config/alacritty/alacritty.toml"
    [[ -f "$config_path" ]] || return 0
    sed -i "" -e "s#solarized_.*.toml#solarized_$theme.toml#g" "$config_path"
}

function ghostty-theme() {
    local theme="${1}"
    local config_path="/Users/vadim/.config/ghostty/config"
    [[ -f "$config_path" ]] || return 0
    local theme_cap="$(tr '[:lower:]' '[:upper:]' <<< ${theme:0:1})${theme:1}"
    sed -i "" -e "s#^theme = Iterm2 Solarized.*#theme = Iterm2 Solarized $theme_cap#g" "$config_path"
}

function change_background() {
    local mode="light"

    if defaults read -g AppleInterfaceStyle &> /dev/null; then
        mode="dark"
    fi

    # change tmux (only if tmux server is running)
    #
    # NOTE: this file is sourced by oh-my-zsh (ZSH_CUSTOM) in *every*
    # interactive shell, not just by the dark-notify launchd job, so this
    # block must be a no-op when the mode has not actually changed. @theme_mode
    # is set by the sidebar conf files and by tmux.conf at server start.
    if command -v tmux &>/dev/null && tmux list-sessions &>/dev/null; then
        local applied="$(tmux show -gv @theme_mode 2>/dev/null)"
        if [[ "$applied" != "$mode" ]]; then
            case $mode in
                dark)
                    tmux source-file ~/.dotfiles/tmux-statusline-dark.conf
                    tmux source-file ~/.dotfiles/tmux-sidebar-dark.conf
                    ;;
                light)
                    tmux source-file ~/.dotfiles/tmux-statusline-light.conf
                    tmux source-file ~/.dotfiles/tmux-sidebar-light.conf
                    ;;
            esac
            # tmux-agent-sidebar reads its palette once, at sidebar startup, so
            # a running sidebar keeps the old colors until it is restarted.
            # Restart per-window rather than via `toggle-all`, which would also
            # open a sidebar in windows that deliberately don't have one.
            #
            # Do NOT name a loop variable `path` here — in zsh `path` is tied to
            # $PATH, and this file is sourced by every interactive shell.
            local sidebar_bin="$(tmux show -gv @agent_sidebar_bin 2>/dev/null)"
            if [[ -x "$sidebar_bin" ]]; then
                local sb_role sb_win sb_dir
                tmux list-panes -a -F '#{@pane_role}|#{window_id}|#{pane_current_path}' \
                    2>/dev/null | while IFS='|' read -r sb_role sb_win sb_dir; do
                    [[ "$sb_role" == "sidebar" ]] || continue
                    "$sidebar_bin" toggle "$sb_win" "$sb_dir"  # close
                    "$sidebar_bin" toggle "$sb_win" "$sb_dir"  # reopen w/ new palette
                done
            fi
        fi
    fi

    # change alacritty
    # alacritty-theme "$mode"

    # change ghostty
    # ghostty-theme "$mode"
    # Trigger config reload via menu item (more reliable than keystroke from launchd)
    # osascript -e 'tell application "System Events" to click menu item "Reload Configuration" of menu "Ghostty" of menu bar 1 of application process "ghostty"' &>/dev/null
}

change_background
