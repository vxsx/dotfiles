# divio autocomplete setup
DIVIO_AC_ZSH_SETUP_PATH=/Users/vadim/Library/Caches/@divio/cli/autocomplete/zsh_setup && test -f $DIVIO_AC_ZSH_SETUP_PATH && source $DIVIO_AC_ZSH_SETUP_PATH;

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/vadim/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

eval "$(zoxide init --cmd cd zsh)"

