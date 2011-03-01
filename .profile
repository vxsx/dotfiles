export PS1="[\u@\h \w]$ "


parse_git_branch() {
  ref=$(git symbolic-ref -q HEAD 2> /dev/null) || return
  printf " on ${1:-%s}" "${ref#refs/heads/}"
}

pimp_prompt() {
  local        BLUE="\[\033[0;34m\]"
  local   BLUE_BOLD="\[\033[1;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[0;37m\]"
  local  WHITE_BOLD="\[\033[1;37m\]"  
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
#PS1="${TITLEBAR}[$WHITE\u@$BLUE_BOLD\h$WHITE \w$GREEN\$(parse_git_branch)\$(parse_svn_revision) $RED\$(~/.rvm/bin/rvm-prompt v g)$WHITE]\$ "
PS1="${TITLEBAR}[$WHITE\u@\h$WHITE \w$GREEN\$(parse_git_branch)$WHITE]\$ "
PS2='> '
PS4='+ '
}
pimp_prompt