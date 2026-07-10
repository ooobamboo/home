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

open-secret() {
    gocryptfs /home/seriola/wsp/cryptdata/secret_cipher /home/seriola/wsp/cryptdata/secret
}

close-secret() {
    fusermount -u /home//seriola/wsp/cryptdata/secret
}

checksum() {
    cd "${1:-.}"
    find . -type f -exec sha256sum {} + | sort -k 2
}

viewcolor() {
    local hex="${1#\#}"
    local r=$(printf "%d" "0x${hex:0:2}")
    local g=$(printf "%d" "0x${hex:2:2}")
    local b=$(printf "%d" "0x${hex:4:2}")
    
    echo -e "\e[48;2;${r};${g};${b}m      \e[0m  #${hex}"
}

mic() {
    cava -p <(echo -e "[input]\nmethod = pulse\nsource = echo_cancel")
}

mu() {
  [ -z "$@" ] && \
      ps axh -o rss,pid,cmd:20 --sort=-rss | awk '{printf "%s %s %.2f MB\n", $2, $3, $1/1024}' | head -20 | column -t || \
      ps -o rss,pid,cmd -p $(pidof -x "$@") | awk 'NR==1 {print; next} {printf "%s %s %.2f MB\n", $2, $3, $1/1024}' | column -t
}

netcheck() {
  local ip=1.2.3.4
  if expr "$ip" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
    echo "success"
  else
    echo "fail"
  fi
}

ipl() {
    local ip="${1:-$(curl -sfm5 ifconfig.me)}"
    local prefix="IP"
    [[ "$ip" =~ [a-zA-Z] ]] && {
        [[ "$ip" =~ ^https?:// ]] && prefix=$(echo "$ip" | sed 's|^[^/]*//||;s|/.*||') || prefix="$ip"
        ip=$(dig +short +tls @1.1.1.1 "$prefix" 2>/dev/null | tail -n1)
    }
    [[ -z "$ip" ]] && echo "Fetch/Resolve failed" && return 1

    local mmdb_file="${XDG_DATA_HOME}/geoip/GeoLite2-Country.mmdb"
    local country=$(mmdblookup --file "$mmdb_file" --ip "$ip" country names en 2>/dev/null | grep '"' | cut -d'"' -f2)
    local code=$(mmdblookup --file "$mmdb_file" --ip "$ip" country iso_code 2>/dev/null | grep '"' | cut -d'"' -f2)
    [ -z "$country" ] && country="Unknown"

    local flag=$(python3 -c "c='$code'; print(''.join(chr(0x1F1E6+ord(x)-65) for x in c) if len(c)==2 else '🌐')")
    
    printf "%s: [%s %s] (%s)\n" "$prefix" "$flag" "$country" "$ip"
}

doc2pdf() {
    for f in "$@"; do
        [ -f "$f" ] && flatpak run org.libreoffice.LibreOffice --headless --convert-to pdf --outdir "${f:h}" "$f"
    done
}
