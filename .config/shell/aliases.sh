alias ls="ls --color=auto"

alias lf="lfcd; printf '\033[0m'"

alias wget='wget --hsts-file="$XDG_STATE_HOME/wget-hsts"'

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

alias arduino-cli='arduino-cli --config-file $XDG_CONFIG_HOME/arduino15/arduino-cli.yaml'

alias dotfiles='/usr/bin/git --git-dir="$XDG_DOCUMENTS_DIR/.dotfiles/" --work-tree="$HOME"'

alias adb='HOME="$XDG_STATE_HOME/adb" adb'
