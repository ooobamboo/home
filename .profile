# .profile

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export BROWSER="$XDG_DATA_HOME/flatpak/exports/bin/org.chromium.Chromium"

# theme
export QT_QPA_PLATFORMTHEME=qt6ct
export GTK_THEME=Adwaita:dark

# ime
export QT_IM_MODULES="wayland;fcitx;ibus"
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx

# config
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/npm"

# cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NUGET_PACKAGES="$XDG_CACHE_HOME/nuget/package"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export UV_CACHE_DIR="$HOME/.local/src/uv/cache"

# state
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export MYSQL_HISTFILE="$XDG_STATE_HOME/mariadb/history"
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite_history
export HISTFILE="$XDG_STATE_HOME/history"
export GDBHISTFILE="$XDG_STATE_HOME"/gdb/history
export CALCHISTFILE="$XDG_STATE_HOME/calc_history"

# data
export W3M_DIR="$XDG_DATA_HOME/w3m"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NIMBLE_DIR="$XDG_DATA_HOME/nimble"
export R_LIBS_USER="$XDG_DATA_HOME/R"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password
export ZVM_PATH="$XDG_DATA_HOME/zvm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export MANPATH="$XDG_DATA_HOME/man:/usr/share/man:"

# mirrors
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export GOPROXY="https://mirrors.aliyun.com/goproxy" 
export UV_INDEX_URL="https://mirrors.nju.edu.cn/pypi/web/simple"

export GRIM_DEFAULT_DIR=$HOME/tmp
export LIBVIRT_DEFAULT_URI="qemu:///system"

export NO_AT_BRIDGE=1

# native wayland
export SDL_VIDEO_DRIVER=wayland
export SDL_VIDEODRIVER="wayland,x11"
export _JAVA_AWT_WM_NONREPARENTING=1

# android
export ANDROID_HOME=$XDG_DATA_HOME/android
export ANDROID_SDK_ROOT=$XDG_DATA_HOME/android

PATH="$HOME/.local/bin:\
$XDG_DATA_HOME/flatpak/exports/bin:\
$CARGO_HOME/bin:\
$GOPATH/bin:\
$XDG_DATA_HOME/zvm/bin:\
$XDG_DATA_HOME/npm/bin:\
$ANDROID_HOME/platform-tools:\
$PATH"
export PATH

export XDG_SESSION_TYPE=wayland
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
	exec dbus-run-session -- river &> /dev/null
fi
