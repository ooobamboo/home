. /etc/bash/bashrc
. /usr/share/git/git-prompt.sh
. $XDG_CONFIG_HOME/shell/aliases.sh
. $XDG_CONFIG_HOME/shell/functions.sh

PS1='\h \w$(__git_ps1 " (%s)")$(c=$?; ((c)) && echo " $c") \$ '

export HISTSIZE=10000

export GPG_TTY=$(tty)

source /usr/share/bash-completion/completions/git
__git_complete dotfiles __git_main

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
