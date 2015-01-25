#compdef lancet

typeset -ga common_opts
common_opts=(
    '--help[Show help]'
)

local expl
local -a hprojects

_harvest_projects() {
    # TODO: parse output and present it in the form ((id\:descr id2\:descr2))
    # TODO: and then cache output for 1-2h at least
    # hprojects=(`lancet harvest-projects`)
}

_lancet_commands() {
    local -a commands

    commands=(
        'activate:Switch to this project.'
        'browse:Open the issue tracker page for the given issue ID.'
        'harvest-projects:List Harvest projects, optionally filtered by name.'
        'harvest-tasks:List Harvest tasks for the given project ID.'
        'init:Wizard to create a project-level configuration.'
        'logout:Forget saved passwords for the web services.'
        'pause:Pause work on the current issue.'
        'pr:Create a new pull request for this issue.'
        'resume:Resume work on the currently active issue (based on branch name).'
        'setup:Wizard to create the user-level configuration.'
        'time:Start a Harvest timer for the given issue.'
        'workon:Start work on a given issue.'
    )

    _arguments \
        '--version[Show version and exit]' \
        '--setup-helper[Print shell integration helper and exit]' \
        '--debug[Show debug information]' \
        $common_opts \
        '*:: :->subcmds' && ret=0

    _describe -t commands 'lancet command' commands && ret=0
}

_lancet-activate() {
    _arguments -s : \
        - '(key)' \
            '--key[Project JIRA key]:( )' \
        - '(dir)' \
            '--dir[Project folder]:directory:_directories' \
        $common_opts
}
_lancet-browse() {
    _arguments -s : \
        $common_opts && ret=0
}
_lancet-harvest-projects() {
    _arguments -s : \
        $common_opts && ret=0
}
_lancet-harvest-tasks() {
    _arguments -s : \
        $common_opts \
        ': :->projects' && ret=0

    # TODO: complete projects by name
    # if [[ "$state" == projects ]] then
    #     _harvest_projects
    #     _wanted _harvest_projects expl 'Harvest projects' compadd -a hprojects
    # fi
}
_lancet-init() {
    _arguments -s : \
        '--force[init even if .lancet already exists]' \
        $common_opts && ret=0
}
_lancet-logout() {
    _arguments -s : \
        $common_opts && ret=0
    _values "Service" \
        'harvest[log out of Harvest tracker]' \
        'tracker[log out of JIRA]' \
        'github[log out of Github]'
}
_lancet-pause() {
    _arguments -s : \
        $common_opts && ret=0
}
_lancet-pr() {
    _arguments -s : \
        '--base[Branch to make pr to]:( )' \
        '--open-pr[Open PR in browser after creating]' \
        $common_opts && ret=0
}
_lancet-resume() {
    _arguments -s : \
        $common_opts && ret=0
}
_lancet-setup() {
    _arguments -s : \
        '--force[init even if ~/.lancet already exists]' \
        $common_opts && ret=0
}
_lancet-time() {
    _arguments -s : \
        $common_opts \
        ': :->issue' && ret=0
}
_lancet-workon() {
    _arguments -s : \
        $common_opts \
        '--base[Base branch]:( )' \
        ': :->issue' && ret=0
}

_lancet() {
    local curcontext=$curcontext ret=1

    if ((CURRENT == 2)); then
        _lancet_commands
    else
        shift words
        ((CURRENT --))
        curcontext="${curcontext%:*:*}:lancet-$words[1]:"
        _call_function ret _lancet-$words[1]
    fi
}

compdef _lancet lancet
