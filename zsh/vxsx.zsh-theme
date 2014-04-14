# based on "blinks" theme
# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

function _prompt_stuff() {
    if [ -n "$TMUX" ]; then
        echo " %{%b%k%f%}%{%F{${bkg}}%}"
    else
        echo "%E" #stupid tmux doesn't draw a line to the end of the screen :(
    fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.
case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(git_prompt_info)%{%f%b%}%{%K{${bkg}}$(_prompt_stuff)%}%{%b%k%f%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%} %#%{%f%k%b%} '

# RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
RPROMPT='!%{%B%F{cyan}%}%! %*%{%f%k%b%}'
