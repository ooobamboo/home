bk() {
    [ -f "$1" ] && cp -iv "$1" "$1~"
}

checksum() {
    cd "${1:-.}"
    find . -type f -exec sha256sum {} + | sort -k 2
}

hex_to_rgb() {
    : "${1/\#}"
    ((r=16#${_:0:2},g=16#${_:2:2},b=16#${_:4:2}))
    printf '%s\n' "$r $g $b"
}

rgb_to_hex() {
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}

fkill() {
    local pid
    pid=$( ([ "$UID" -eq 0 ] && ps -ef || ps -f -u "$UID") | sed 1d | fzy | awk '{print $2}')
    [ -n "$pid" ] && kill -"${1:-9}" "$pid"
}

fh() {
    local cmd
    cmd=$( (fc -l 1 || history) | sed -E 's/ *[0-9]*\*? *//' | tac | fzy)
    [ -n "$cmd" ] && eval "$cmd"
}

xmd() {
    xbps-query -m | xargs -P 0 -I {} \
        sh -c 'echo "$(xbps-query -p install-date "$1")  $1"' _ {} | sort ${1:+"$1"}
}

fetch() {
	printf '%s@%s\n%-10sVoid Linux\n%-10s%s\n%-10s%s\n%-10s%s\n%-10s%s\n' \
		"$USER" "$(hostname)" \
		"OS:" \
		"KERNEL:" "$(uname -sr)" \
		"UPTIME:" "$(uptime -p | sed 's/up //')" \
		"PACKAGES:" "$(xbps-query -l | wc -l)" \
		"SHELL:" "${SHELL##*/}"
}

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

PS0+='\e]133;C\e\\'
command_done() {
    printf '\e]133;D\e\\'
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }command_done

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd

prompt_marker() {
    printf '\e]133;A\e\\'
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }prompt_marker
