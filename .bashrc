PS1=" \w \$ "
. /usr/share/bash-completion/bash_completion

source $XDG_CONFIG_HOME/shell/aliases.sh
source $XDG_CONFIG_HOME/shell/functions.sh

set -o vi

export HISTSIZE=10000

export GPG_TTY=$(tty)
