alias ls="ls --color=auto"

alias lf="lfcd"

alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias ff="fastfetch"

alias dotfiles='/usr/bin/git --git-dir="$HOME/doc/.dotfiles/" --work-tree="$HOME"'

alias adb='HOME="${XDG_STATE_HOME:-$HOME/.local/state}/adb" adb'

alias update='sudo xbps-install -Syu; flatpak update'
