. /etc/bash/bashrc
. /usr/share/git/git-prompt.sh
. $XDG_CONFIG_HOME/shell/aliases.sh
. $XDG_CONFIG_HOME/shell/functions.sh

PS1='\h \w $(c=$?; ((c)) && echo "$c ")\$ '

export HISTSIZE=10000

export GPG_TTY=$(tty)

eval "$(mise activate bash)"
