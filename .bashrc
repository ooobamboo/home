. /usr/share/bash-completion/bash_completion

PS1='$PWD $ '
PROMPT_COMMAND='printf "\033]7;file://%s%s\033\\" "$HOSTNAME" "$PWD"'

source $XDG_CONFIG_HOME/shell/aliases.sh
source $XDG_CONFIG_HOME/shell/functions.sh

set -o vi

export HISTSIZE=10000

export GPG_TTY=$(tty)

eval "$(mise activate bash)"
