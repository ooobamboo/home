bk() {
    [ -f "$1" ] && cp -iv "$1" "$1~"
}

clock() {
    while :; do
        local current_time=$(date +%T)
        echo -ne "$current_time\033[K\r"
        sleep 1
    done
}

weather() {
    curl -s 'wttr.in/{Guangzhou,Taichung}?format=3'
}

checksum() {
    cd "${1:-.}"
    find . -type f -exec sha256sum {} + | sort -k 2
}

fkill() {
    local pid
    pid=$( ([ "$UID" -eq 0 ] && ps -ef || ps -f -u "$UID") | sed 1d | fzy | awk '{print $2}' )
    [ -n "$pid" ] && kill -"${1:-9}" "$pid"
}

fh() {
    local cmd
    cmd=$( (fc -l 1 || history) | sed -E 's/ *[0-9]*\*? *//' | tac | fzy )
    [ -n "$cmd" ] && eval "$cmd"
}

fcd() {
    local file dir
    file=$(bfs -type f \
        -exclude -name .git \
        .| fzy -l 30 -q "$1")
    [ -n "$file" ] && dir=$(dirname "$file") && cd "$dir"
}

fif() {
    [ -z "$1" ] && echo ">" && return 1
    local res file line

    res=$(rg --line-number --no-heading --color=never --smart-case \
        -g '!.git' "$1" 2>/dev/null | fzy -l 25)

    [ -z "$res" ] && return
    file=$(echo "$res" | cut -d: -f1)
    line=$(echo "$res" | cut -d: -f2)

    ${EDITOR} "+$line" "$file"
}

xmd() {
    python3 -c '
        import glob, plistlib, sys
        db = glob.glob("/var/db/xbps/pkgdb-*.plist")[0]
        with open(db, "rb") as f:
            data = plistlib.load(f)
        res = [
            (v.get("install-date", ""), k) 
            for k, v in data.items() 
            if not k.startswith("_") and isinstance(v, dict) and not v.get("automatic-install")
        ]
        for date, pkg in sorted(res, reverse="-r" in sys.argv):
            print(f"{date}  {pkg}")
    ' "$@"
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
