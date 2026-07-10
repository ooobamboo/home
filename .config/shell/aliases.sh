# .config/zsh/aliases.zsh

alias ls="ls --color=auto"

alias rr="dbus-run-session -- river"
alias st="exec /usr/bin/gamescope -W 2560 -H 1600 -r 165 -f -m 1 -e -- steam"

alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias ff="fastfetch"

alias wshowkeys="wshowkeys -a bottom -F 'monospace 20'"

alias dotfiles='/usr/bin/git --git-dir="$HOME/doc/.dotfiles/" --work-tree="$HOME"'
