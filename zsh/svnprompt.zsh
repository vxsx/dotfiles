# Highlight STDIN based on PCRE patterns.
function highlight {
    local color=33;
    local perl_regex='';
    while [ $# -gt 0 ]; do
        local brightness=1;
        local param="$1";
        if [ "${param:0:2}" = "--" ]; then
            if [[ "${param:2:5}" == "dark-" ]]; then
                    brightness=0;
                    param="--${param:7}";
            elif [ "${param:2:6}" == "light-" ]; then
                    brightness=1;
                    param="--${param:8}";
            fi;
            case "${param:2}" in
                'black' | 'red' | 'green' | 'yellow' | 'blue' | 'magenta' | 'pink' | 'cyan' | 'white')
                    param="--color=${param:2}";
                    ;;
            esac;
        fi;
        if [[ "${param:0:8}" = '--color=' ]]; then
            case ${param:8} in
                'black')
                    color=30;;
                'red')
                    color=31;;
                'green')
                    color=32;;
                'yellow')
                    color=33;;
                'blue')
                    color=34;;
                'magenta' | 'pink')
                    color=35;;
                'cyan')
                    color=36;;
                'white')
                    color=37;;
                *) echo default;;
            esac
            shift;
        fi
        perl_regex="$perl_regex;s@${1//@/\\@/}@$(echo -n $'\e['$brightness';'$color'm$&'$'\e[m')@g";
        shift;
    done;
    perl -p -e "select(STDOUT); $| = 1; ${perl_regex:1}";
}

#intercept calls to svn
svn () {

  #bail if the user didnt specify which subversion command to invoke
  if [ $# -lt 1 ]; then
    command svn
    return
  fi

  local sub_cmd=$1
  shift

  #intercept svn diff commands
  if [[ $sub_cmd == diff ]]; then

    #colorize the diff in vim
    #need to do "syntax on" in your vimrc
    command svn diff "$@" | vim -R -

  #add some color to svn status output and page if needed:
  #M = blue
  #A = green
  #D/!/~ = red
  #C = magenta
  #
  #note that C and M can be preceded by whitespace - see $svn help status
  elif [[ $sub_cmd =~ ^(status|st)$ ]]; then
    svnst
    #see below
  #page some stuff I often end up paging manually
  elif [[ $sub_cmd =~ ^(blame|help|h|cat)$ ]]; then
    command svn $sub_cmd "$@" | less -F

  #colorize and page svn log
  #rearrange the date field from:
  #  2010-10-08 21:19:24 +1300 (Fri, 08 Oct 2010)
  #to:
  #  2010-10-08 21:19 (Fri, +1300)
  elif [[ $sub_cmd == log ]]; then
    command svn log "$@" | less -RF

  #let svn handle it as normal
  else
    command svn $sub_cmd "$@"
  fi
}

# Pretty svn status
svnst () {
    declare -a modified_files;
    declare -a untracked_files;
    while read line; do
        sstatus="${line:0:1}";
        file="${line:2}";
        while [ "${file:0:1}" = ' ' -a "${#file}" -gt 0 ]; do
            file="${file# }";
        done;
        case "$sstatus" in
            'M' | 'A' | 'D' | '!')
                modified_files+=("$sstatus$file");
                ;;
            *)
                untracked_files+=("$file");
        esac;
    done < <(command svn status "$@" | egrep -v '(front|back)end/files');
    if [ ${#modified_files[@]} -gt 0 ]; then
        echo '# Changes to be committed:';
        echo '#   (use "svn revert <file>..." to discard changes in working directory)';
        echo '#';
        for file in "${modified_files[@]}"; do
            sstatus="${file:0:1}";
            case "$sstatus" in
                'M') sstatus='modified';;
                'A') sstatus='new file';;
                'D') sstatus=' deleted';;
                '!') sstatus=' missing';;
            esac;
            file="${file:1}";
            echo $'#      '"$sstatus:    $file";
        done | highlight --dark-green '[^#]*' --dark-red 'missing.*';
    else
        echo '# Nothing to commit.';
    fi;
    if [ ${#untracked_files[@]} -gt 0 ]; then
        [ ${#modified_files[@]} -gt 0 ] && echo '#';
        echo '# Untracked files:';
        echo '#   (use "svn add <file>..." to include in what will be committed)';
        echo '#';
        for file in "${untracked_files[@]}"; do
            echo $'#      '"$file";
        done | highlight --dark-cyan '[^#]*';
    fi;
}
