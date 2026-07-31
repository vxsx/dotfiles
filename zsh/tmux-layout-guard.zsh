#autoload

# Keep tmux-agent-sidebar out of project-layout tools' window layouts.
#
# The sidebar's `after-new-window` hook splits a sidebar pane into every new
# window. A layout tool then applies the project's layout (main-horizontal &c.)
# with `select-layout`, which treats that sidebar pane as just another pane and
# folds it into the arrangement — so the window comes up scrambled. tmuxinator is
# the only tool that needs guarding: 8 of 17 ~/.config/tmuxinator/*.yml set an
# explicit layout. herdr-spreader looks like a second candidate and isn't one —
# it builds herdr tabs over herdr's socket API rather than tmux windows, so no
# after-new-window hook fires and there is no select-layout to interfere with.
#
# `@sidebar_auto_create track` (local patch 0004) makes auto-creation follow
# `@sidebar_enabled`, so turning that off while a project is being built means
# the layout is applied to windows that contain no sidebar. `prefix + E`
# afterwards adds them back — and, being an explicit choice, re-enables tracking.
#
# NOTE: every *.zsh in this directory is sourced by every interactive shell
# (oh-my-zsh ZSH_CUSTOM), so never name a variable `path` here — zsh ties it to
# $PATH and clobbering it breaks the shell.

# Disable sidebar auto-creation, then restore the previous value from a detached
# job. Restoring inline would not work: tmuxinator attaches by default and blocks
# until you detach, which would leave sidebars disabled for the whole session.
# Every window and its layout is created in the first seconds, so a short delay
# covers the part that matters.
function _sidebar_layout_guard() {
    command -v tmux >/dev/null 2>&1 || return 0

    # `tmux set -g` needs a server; starting one is a no-op if it already exists
    # and is cheap if it doesn't (the layout tool would start it regardless).
    command tmux start-server 2>/dev/null || return 0

    local sidebar_prev
    sidebar_prev="$(command tmux show -gv @sidebar_enabled 2>/dev/null)"
    command tmux set -g @sidebar_enabled off 2>/dev/null

    (
        command sleep 15
        command tmux set -g @sidebar_enabled "${sidebar_prev:-on}" 2>/dev/null
    ) &!
}

function tmuxinator() {
    _sidebar_layout_guard
    command tmuxinator "$@"
}
