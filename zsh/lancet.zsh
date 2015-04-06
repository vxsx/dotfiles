# Lancet integration
lancet _autocomplete | source /dev/stdin
lancet _setup_helper | source /dev/stdin
# #compdef lancet
#
# typeset -ga common_opts
# common_opts=(
#     "${(@f)$(lancet _arguments)}"
# )
#
# local expl
# local -a hprojects
#
# _harvest_projects() {
#     # TODO: parse output and present it in the form ((id\:descr id2\:descr2))
#     # TODO: and then cache output for 1-2h at least
#     # hprojects=(`lancet harvest-projects`)
# }
#
# _lancet_commands() {
#     local -a commands
#
#     commands=(
#         "${(@f)$(lancet _commands)}"
#     )
#
#     _arguments \
#         $common_opts \
#         '*:: :->subcmds' && ret=0
#
#     _describe -t commands 'lancet command' commands && ret=0
# }
#
# _lancet-activate() {
#     _arguments -s : \
#         - '(key)' \
#             '--key[Project JIRA key]:( )' \
#         - '(dir)' \
#             '--dir[Project folder]:directory:_directories' \
#         $common_opts
# }
# _lancet-browse() {
#     _arguments -s : \
#         $common_opts && ret=0
# }
# _lancet-harvest-projects() {
#     _arguments -s : \
#         $common_opts && ret=0
# }
# _lancet-harvest-tasks() {
#     _arguments -s : \
#         $common_opts \
#         ': :->projects' && ret=0
#
#     # TODO: complete projects by name
#     # if [[ "$state" == projects ]] then
#     #     _harvest_projects
#     #     _wanted _harvest_projects expl 'Harvest projects' compadd -a hprojects
#     # fi
# }
# _lancet-init() {
#     _arguments -s : \
#         "${(@f)$(lancet _arguments init)}" && ret=0
# }
# _lancet-logout() {
#     _arguments -s : \
#         $common_opts && ret=0
#     _values "Service" \
#         'harvest[log out of Harvest tracker]' \
#         'tracker[log out of JIRA]' \
#         'github[log out of Github]'
# }
# _lancet-pause() {
#     _arguments -s : \
#         $common_opts && ret=0
# }
# _lancet-pr() {
#     _arguments -s : \
#         '--base[Branch to make pr to]:( )' \
#         '--open-pr[Open PR in browser after creating]' \
#         $common_opts && ret=0
# }
# _lancet-resume() {
#     _arguments -s : \
#         $common_opts && ret=0
# }
# _lancet-setup() {
#     _arguments -s : \
#         '--force[init even if ~/.lancet already exists]' \
#         $common_opts && ret=0
# }
# _lancet-time() {
#     _arguments -s : \
#         $common_opts \
#         ': :->issue' && ret=0
# }
# _lancet-workon() {
#     _arguments -s : \
#         $common_opts \
#         '--base[Base branch]:( )' \
#         ': :->issue' && ret=0
# }
# _lancet-checkout() {
#     _arguments -s : \
#         $common_opts \
#         ': :->issue' && ret=0
# }
#
# _lancet() {
#     local curcontext=$curcontext ret=1
#
#     if ((CURRENT == 2)); then
#         _lancet_commands
#     else
#         shift words
#         ((CURRENT --))
#         curcontext="${curcontext%:*:*}:lancet-$words[1]:"
#         _call_function ret _lancet-$words[1]
#
#         # TODO: when everything is implemented in lancet, we can use this basically
#         # instead of _call_function
#         #
#         # _arguments -s : \
#         #     "${(@f)$(lancet _arguments $words[1])}" && ret=0
#     fi
# }
#
# compdef _lancet lancet
