eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
