#!/bin/bash

# ==========================================
#   Dnzcyber Linux v12.0 (Clean Edition)
# ==========================================

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
NC='\033[0m'

INSTALL_DIR="$HOME/.dnzcyber"
REPO_URL="https://github.com/DanzXditz/Dnzcyber-Linux.git"

loading() {
    echo -n -e "${YELLOW}[*] $1 ${NC}"
    for i in {1..3}; do echo -n "."; sleep 0.5; done
    echo ""
}

tampilkan_banner() {
    clear
    echo -e "${GREEN}"
    echo "  ____  _   _ ______   _______     __"
    echo " |  _ \| \ | |___  /  / ____\ \   / /"
    echo " | | | |  \| |  / /  | |     \ \_/ / "
    echo " | |_| | |\  | / /__ | |___   \   /  "
    echo " |____/|_| \_/_____|  \_____|  |_|   "
    echo -e "${NC}"
    echo "----------------------------------------"
    echo -e "${CYAN}   Dnzcyber Linux - Silent. Stealth. Secure.${NC}"
    echo "----------------------------------------"
    echo ""
}

cek_tools() {
    if command -v nmap &> /dev/null; then NMAP_ST="${GREEN}OK${NC}"; else NMAP_ST="${RED}--${NC}"; fi
    if command -v sqlmap &> /dev/null; then SQLMAP_ST="${GREEN}OK${NC}"; else SQLMAP_ST="${RED}--${NC}"; fi
    if command -v wafw00f &> /dev/null; then WAF_ST="${GREEN}OK${NC}"; else WAF_ST="${RED}--${NC}"; fi
    if command -v whois &> /dev/null; then WHOIS_ST="${GREEN}OK${NC}"; else WHOIS_ST="${RED}--${NC}"; fi
    if command -v dig &> /dev/null; then DIG_ST="${GREEN}OK${NC}"; else DIG_ST="${RED}--${NC}"; fi
    if command -v nc &> /dev/null; then NC_ST="${GREEN}OK${NC}"; else NC_ST="${RED}--${NC}"; fi
    if [ -d "otp" ]; then OTP_ST="${GREEN}OK${NC}"; else OTP_ST="${RED}--${NC}"; fi
    if [ -d "NumInfo" ]; then NUM_ST="${GREEN}OK${NC}"; else NUM_ST="${RED}--${NC}"; fi
}

cek_keluar() {
    [ "$1" == "0" ] || [ "$1" == "menu" ] || [ "$1" == "back" ] && return 0
    return 1
}

menu_utama() {
    tampilkan_banner
    cek_tools
    echo -e "${CYAN}===========================================${NC}"
    echo -e "${GREEN}          Dnzcyber Linux v12.0${NC}"
    echo -e "${CYAN}===========================================${NC}"
    echo ""
    echo -e "  ${YELLOW}[01]${NC}  Setup & Install Tools"
    echo -e "  ${YELLOW}[02]${NC}  Nmap Workspace             ${NMAP_ST}"
    echo -e "  ${YELLOW}[03]${NC}  SQLMap Workspace           ${SQLMAP_ST}"
    echo -e "  ${YELLOW}[04]${NC}  Wafw00f Workspace          ${WAF_ST}"
    echo -e "  ${YELLOW}[05]${NC}  Whois Lookup               ${WHOIS_ST}"
    echo -e "  ${YELLOW}[06]${NC}  DNS Lookup                 ${DIG_ST}"
    echo -e "  ${YELLOW}[07]${NC}  Reverse DNS / Ping"
    echo -e "  ${YELLOW}[08]${NC}  HTTP Headers Analyzer"
    echo -e "  ${YELLOW}[09]${NC}  Netcat (Port Connect)      ${NC_ST}"
    echo -e "  ${YELLOW}[10]${NC}  Gobuster (Directory Scan)"
    echo -e "  ${YELLOW}[11]${NC}  Lacak IP Address"
    echo -e "  ${YELLOW}[12]${NC}  Info Nomor HP/WA (OSINT)   ${NUM_ST}"
    echo -e "  ${YELLOW}[13]${NC}  OTP WhatsApp               ${OTP_ST}"
    echo -e "  ${YELLOW}[14]${NC}  Custom Command Runner"
    echo -e "  ${YELLOW}[15]${NC}  Update Dnzcyber"
    echo -e "  ${YELLOW}[16]${NC}  Game Zone 🎮"
    echo -e "  ${YELLOW}[17]${NC}  Keluar"
    echo ""
    read -p "Pilih menu (1-17): " pilihan

    case $pilihan in
        1|01) menu_setup ;;
        2|02) ws_nmap ;;
        3|03) ws_sqlmap ;;
        4|04) ws_waf ;;
        5|05) ws_whois ;;
        6|06) ws_dns ;;
        7|07) ws_revdns_ping ;;
        8|08) ws_http ;;
        9|09) ws_netcat ;;
        10) ws_gobuster ;;
        11) fitur_lacak_ip ;;
        12) fitur_info_nomor ;;
        13) fitur_otp ;;
        14) ws_custom ;;
        15) do_update ;;
        16) menu_game ;;
        17) echo -e "${RED}Keluar...${NC}"; exit ;;
        *) echo -e "${RED}Invalid!${NC}"; sleep 1; menu_utama ;;
    esac
}

menu_setup() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== SETUP & INSTALL ===${NC}"
    echo ""
    echo "  [1] Update Sistem"
    echo "  [2] Install Tools Dasar"
    echo "  [3] Install Nmap"
    echo "  [4] Install SQLMap"
    echo "  [5] Install Wafw00f"
    echo "  [6] Install Whois & DNS"
    echo "  [7] Install Netcat"
    echo "  [8] INSTALL SEMUA"
    echo "  [0] Kembali"
    echo ""
    read -p "Pilih: " s
    case $s in
        1) clear; loading "Update"; pkg update -y && pkg upgrade -y; read -p "Enter..."; menu_setup ;;
        2) clear; loading "Install dasar"; pkg install -y git python nano coreutils; read -p "Enter..."; menu_setup ;;
        3) clear; loading "Install Nmap"; pkg install -y nmap; read -p "Enter..."; menu_setup ;;
        4) clear; loading "Install SQLMap"; pip install sqlmap; read -p "Enter..."; menu_setup ;;
        5) clear; loading "Install Wafw00f"; pip install wafw00f; read -p "Enter..."; menu_setup ;;
        6) clear; loading "Install Whois & DNS"; pkg install -y whois dnsutils; read -p "Enter..."; menu_setup ;;
        7) clear; loading "Install Netcat"; pkg install -y netcat-openbsd; read -p "Enter..."; menu_setup ;;
        8) clear
           loading "Update Sistem"; pkg update -y && pkg upgrade -y
           loading "Tools Dasar"; pkg install -y git python nano coreutils
           loading "Nmap"; pkg install -y nmap
           loading "SQLMap"; pip install sqlmap
           loading "Wafw00f"; pip install wafw00f
           loading "Whois & DNS"; pkg install -y whois dnsutils
           loading "Netcat"; pkg install -y netcat-openbsd
           echo -e "${GREEN}[+] SEMUA SELESAI!${NC}"; read -p "Enter..."; menu_setup ;;
        0) menu_utama ;;
        *) sleep 1; menu_setup ;;
    esac
}

ws_nmap() {
    clear; tampilkan_banner
    if ! command -v nmap &> /dev/null; then echo -e "${RED}[!] Nmap belum terinstall.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== NMAP WORKSPACE ===${NC}"
    echo "  [1] Quick Scan"
    echo "  [2] Service Scan"
    echo "  [3] OS Detection"
    echo "  [4] Aggressive Scan"
    echo "  [5] Scan Subnet /24"
    echo "  [6] Custom"
    echo "  [0] Kembali"
    read -p "Pilih: " pil
    case $pil in
        1|2|3|4|5|6)
            if [ "$pil" == "5" ]; then read -p "Subnet (0=kembali): " t
            else read -p "Target (0=kembali): " t; fi
            cek_keluar "$t" && menu_utama
            [ -z "$t" ] && { sleep 1; ws_nmap; }
            clear; loading "Scanning $t"
            echo -e "${CYAN}------${NC}"
            case $pil in
                1) nmap -F "$t" ;; 2) nmap -sV "$t" ;; 3) nmap -O "$t" ;;
                4) nmap -A "$t" ;; 5) nmap -sn "$t" ;;
                6) read -p "Cmd: " c; nmap $c ;;
            esac
            echo -e "${CYAN}------${NC}"
            read -p "Enter lanjut, atau '0' menu: " l
            cek_keluar "$l" && menu_utama
            ws_nmap ;;
        0) menu_utama ;;
        *) sleep 1; ws_nmap ;;
    esac
}

ws_sqlmap() {
    clear; tampilkan_banner
    if ! command -v sqlmap &> /dev/null; then echo -e "${RED}[!] SQLMap belum terinstall.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== SQLMAP WORKSPACE ===${NC}"
    echo "  [1] Basic Scan"
    echo "  [2] Enum Databases"
    echo "  [3] Enum Tables"
    echo "  [4] Dump Table"
    echo "  [0] Kembali"
    read -p "Pilih: " pil
    case $pil in
        1|2|3|4)
            read -p "URL (0=kembali): " u
            cek_keluar "$u" && menu_utama
            [ -z "$u" ] && { sleep 1; ws_sqlmap; }
            case $pil in
                1) clear; sqlmap -u "$u" --batch ;;
                2) clear; sqlmap -u "$u" --dbs --batch ;;
                3) read -p "DB: " d; clear; sqlmap -u "$u" -D "$d" --tables --batch ;;
                4) read -p "DB: " d; read -p "Tabel: " t; clear; sqlmap -u "$u" -D "$d" -T "$t" --dump --batch ;;
            esac
            read -p "Enter lanjut, atau '0': " l
            cek_keluar "$l" && menu_utama
            ws_sqlmap ;;
        0) menu_utama ;;
        *) sleep 1; ws_sqlmap ;;
    esac
}

ws_waf() {
    clear; tampilkan_banner
    if ! command -v wafw00f &> /dev/null; then echo -e "${RED}[!] Belum install.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== WAFW00F ===${NC}"
    read -p "URL (0=kembali): " u
    cek_keluar "$u" && menu_utama
    clear; wafw00f "$u"
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_waf
}

ws_whois() {
    clear; tampilkan_banner
    if ! command -v whois &> /dev/null; then echo -e "${RED}[!] Belum install.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== WHOIS ===${NC}"
    read -p "Domain (0=kembali): " d
    cek_keluar "$d" && menu_utama
    clear; whois "$d" 2>/dev/null | head -50
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_whois
}

ws_dns() {
    clear; tampilkan_banner
    if ! command -v dig &> /dev/null; then echo -e "${RED}[!] Belum install.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== DNS LOOKUP ===${NC}"
    read -p "Domain (0=kembali): " d
    cek_keluar "$d" && menu_utama
    clear
    echo -e "${CYAN}--- A ---${NC}"; dig +short "$d" A
    echo -e "${CYAN}--- MX ---${NC}"; dig +short "$d" MX
    echo -e "${CYAN}--- NS ---${NC}"; dig +short "$d" NS
    echo -e "${CYAN}--- TXT ---${NC}"; dig +short "$d" TXT | head -5
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_dns
}

ws_revdns_ping() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== REVERSE DNS & PING ===${NC}"
    echo "  [1] Reverse DNS"
    echo "  [2] Ping"
    echo "  [3] Traceroute"
    echo "  [0] Kembali"
    read -p "Pilih: " pil
    case $pil in
        1) read -p "IP: " ip; clear; dig -x "$ip" +short ;;
        2) read -p "Host: " h; read -p "Jumlah: " n; [ -z "$n" ] && n=4; clear; ping -c "$n" "$h" ;;
        3) read -p "Host: " h; clear; traceroute "$h" 2>/dev/null || echo "Coba: pkg install traceroute" ;;
        0) menu_utama ;;
    esac
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_revdns_ping
}

ws_http() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== HTTP HEADERS ===${NC}"
    read -p "URL (0=kembali): " u
    cek_keluar "$u" && menu_utama
    [ -z "$u" ] && { sleep 1; ws_http; }
    [[ "$u" != http* ]] && u="https://$u"
    clear; curl -sIL "$u"
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_http
}

ws_netcat() {
    clear; tampilkan_banner
    if ! command -v nc &> /dev/null; then echo -e "${RED}[!] Belum install.${NC}"; read -p "Enter..."; menu_utama; fi
    echo -e "${CYAN}=== NETCAT ===${NC}"
    read -p "Host (0=kembali): " h
    cek_keluar "$h" && menu_utama
    read -p "Port: " p
    clear; timeout 5 nc -zv "$h" "$p" 2>&1
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_netcat
}

ws_gobuster() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== GOBUSTER ===${NC}"
    if ! command -v gobuster &> /dev/null; then
        echo -e "${RED}[!] Gobuster tidak terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    read -p "URL (0=kembali): " u
    cek_keluar "$u" && menu_utama
    w="/usr/share/wordlists/dirb/common.txt"
    [ ! -f "$w" ] && { mkdir -p /usr/share/wordlists/dirb; curl -sL "https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt" -o "$w"; }
    clear; gobuster dir -u "$u" -w "$w" -t 20 --timeout 10s 2>&1 | head -40
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_gobuster
}

fitur_lacak_ip() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== LACAK IP ===${NC}"
    read -p "IP (0=kembali, Enter=sendiri): " tip
    cek_keluar "$tip" && menu_utama
    [ -z "$tip" ] && tip=$(curl -s ifconfig.me)
    loading "Melacak $tip"
    r=$(curl -s "http://ip-api.com/json/$tip")
    if echo "$r" | grep -q '"status":"success"'; then
        echo "$r" | python -c "
import sys, json
d = json.load(sys.stdin)
print('\033[1;36m========================================\033[0m')
print(f\"\033[1;33m  IP       :\033[0m {d.get('query','N/A')}\")
print(f\"\033[1;33m  Negara   :\033[0m {d.get('country','N/A')}\")
print(f\"\033[1;33m  Region   :\033[0m {d.get('regionName','N/A')}\")
print(f\"\033[1;33m  Kota     :\033[0m {d.get('city','N/A')}\")
print(f\"\033[1;33m  ISP      :\033[0m {d.get('isp','N/A')}\")
lat, lon = d.get('lat',''), d.get('lon','')
print(f\"\033[1;33m  Koordinat:\033[0m {lat}, {lon}\")
print(f\"\033[1;36m  Maps     : https://maps.google.com/?q={lat},{lon}\033[0m\")
"
    else echo -e "${RED}[!] Gagal.${NC}"; fi
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    fitur_lacak_ip
}

fitur_info_nomor() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== INFO NOMOR ===${NC}"
    if [ ! -d "NumInfo" ]; then
        loading "Unduh NumInfo"
        git clone https://github.com/Anon4You/NumInfo.git NumInfo 2>/dev/null
        cd NumInfo && pip install -r requirements.txt 2>/dev/null; cd ..
    fi
    read -p "Nomor (0=kembali): " n
    cek_keluar "$n" && menu_utama
    cd NumInfo; [ -f "numinfo.py" ] && python numinfo.py "$n" || echo "File tidak ada"; cd ..
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    fitur_info_nomor
}

fitur_otp() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== OTP WHATSAPP ===${NC}"
    if [ ! -d "otp" ]; then
        loading "Unduh OTP"
        git clone https://github.com/him0x/otp.git otp 2>/dev/null
    fi
    cd otp
    [ -f "requirements.txt" ] && pip install -r requirements.txt 2>/dev/null
    [ -f "main.py" ] && python main.py || echo "File tidak ada"
    cd ..
    read -p "Enter untuk kembali..."; menu_utama
}

ws_custom() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== CUSTOM COMMAND ===${NC}"
    echo "Ketik '0' untuk kembali."
    read -p "> " cmd
    cek_keluar "$cmd" && menu_utama
    [ -z "$cmd" ] && { sleep 1; ws_custom; }
    clear; eval "$cmd"
    read -p "Enter lanjut, atau '0': " l
    cek_keluar "$l" && menu_utama
    ws_custom
}

do_update() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== UPDATE ===${NC}"
    if [ ! -d "$INSTALL_DIR/.git" ]; then
        cd "$(dirname "$0")" 2>/dev/null
        [ ! -d ".git" ] && { echo -e "${RED}Bukan folder git.${NC}"; read -p "Enter..."; menu_utama; }
    else cd "$INSTALL_DIR"; fi
    loading "Cek update"
    git fetch origin 2>/dev/null
    L=$(git rev-parse HEAD 2>/dev/null)
    R=$(git rev-parse origin/main 2>/dev/null)
    [ -z "$R" ] && R=$(git rev-parse origin/master 2>/dev/null)
    if [ "$L" == "$R" ]; then echo -e "${GREEN}[+] Sudah terbaru!${NC}"
    else
        echo -e "${YELLOW}[*] Update...${NC}"
        git reset --hard origin/main 2>/dev/null || git reset --hard origin/master 2>/dev/null
        chmod +x dnz.sh
        echo -e "${GREEN}[+] Selesai!${NC}"
        read -p "Enter restart..."; exec ./dnz.sh
    fi
    read -p "Enter..."; menu_utama
}

# ==========================================
#   GAME ZONE
# ==========================================
menu_game() {
    clear; tampilkan_banner
    echo -e "${CYAN}============================================${NC}"
    echo -e "${GREEN}          GAME ZONE - Dnzcyber${NC}"
    echo -e "${CYAN}============================================${NC}"
    echo ""
    echo -e "  ${YELLOW}[1]${NC}  Snake"
    echo -e "  ${YELLOW}[2]${NC}  Quiz Hacker"
    echo -e "  ${YELLOW}[3]${NC}  Tic Tac Toe"
    echo -e "  ${YELLOW}[4]${NC}  Rock Paper Scissors"
    echo -e "  ${YELLOW}[5]${NC}  Slot Machine"
    echo -e "  ${YELLOW}[6]${NC}  Tebak Angka"
    echo -e "  ${YELLOW}[0]${NC}  Kembali"
    echo ""
    read -p "Pilih (0-6): " g
    case $g in
        1) game_snake ;; 2) game_quiz ;; 3) game_tictactoe ;;
        4) game_rps ;; 5) game_slot ;; 6) game_tebak ;;
        0) menu_utama ;; *) sleep 1; menu_game ;;
    esac
}

game_snake() {
    clear
    if [ ! -f "$HOME/.dnzcyber/snake.py" ]; then
        echo -e "${RED}[!] snake.py tidak ada di ~/.dnzcyber/${NC}"
        read -p "Enter..."; menu_game
    fi
    python "$HOME/.dnzcyber/snake.py"
    menu_game
}

game_quiz() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== QUIZ HACKER ===${NC}"
    echo -e "${YELLOW}10 soal random dari 40 bank soal${NC}"
    read -p "Enter untuk mulai..."
    if [ ! -f "$HOME/.dnzcyber/quiz.py" ]; then
        echo -e "${RED}[!] quiz.py tidak ada!${NC}"; read -p "Enter..."; menu_game
    fi
    python "$HOME/.dnzcyber/quiz.py"
    menu_game
}

game_tictactoe() {
    board=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    player="X"
    turn=0
    cetak() {
        clear
        echo -e "${CYAN}============================${NC}"
        echo -e "${GREEN}      TIC TAC TOE${NC}"
        echo -e "${CYAN}============================${NC}"
        echo ""
        echo -e "       ${YELLOW}${board[0]}${NC} | ${YELLOW}${board[1]}${NC} | ${YELLOW}${board[2]}${NC}"
        echo -e "      ---+---+---"
        echo -e "       ${YELLOW}${board[3]}${NC} | ${YELLOW}${board[4]}${NC} | ${YELLOW}${board[5]}${NC}"
        echo -e "      ---+---+---"
        echo -e "       ${YELLOW}${board[6]}${NC} | ${YELLOW}${board[7]}${NC} | ${YELLOW}${board[8]}${NC}"
        echo ""
        echo -e "${CYAN}============================${NC}"
        echo ""
    }
    cek() {
        for combo in "0 1 2" "3 4 5" "6 7 8" "0 3 6" "1 4 7" "2 5 8" "0 4 8" "2 4 6"; do
            set -- $combo
            [ "${board[$1]}" == "${board[$2]}" ] && [ "${board[$2]}" == "${board[$3]}" ] && \
            { [ "${board[$1]}" == "X" ] || [ "${board[$1]}" == "O" ]; } && return 0
        done
        return 1
    }
    while [ $turn -lt 9 ]; do
        cetak
        if [ "$player" == "X" ]; then
            read -p "Pilih nomor (1-9, 0=keluar): " pos
            [ "$pos" == "0" ] && { menu_game; return; }
            if ! [[ "$pos" =~ ^[1-9]$ ]] || [ "${board[$((pos-1))]}" == "X" ] || [ "${board[$((pos-1))]}" == "O" ]; then
                echo -e "${RED}Invalid!${NC}"; sleep 1; continue
            fi
            board[$((pos-1))]="X"
        else
            kosong=()
            for i in {0..8}; do
                [ "${board[$i]}" != "X" ] && [ "${board[$i]}" != "O" ] && kosong+=($i)
            done
            [ ${#kosong[@]} -gt 0 ] && board[${kosong[$((RANDOM % ${#kosong[@]}))]}]="O"
        fi
        if cek; then
            cetak
            [ "$player" == "X" ] && echo -e "${GREEN}KAMU MENANG!${NC}" || echo -e "${RED}AI MENANG!${NC}"
            read -p "Enter main lagi..."; game_tictactoe; return
        fi
        turn=$((turn+1))
        [ "$player" == "X" ] && player="O" || player="X"
    done
    cetak
    echo -e "${YELLOW}SERI!${NC}"
    read -p "Enter main lagi..."; game_tictactoe
}

game_rps() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== ROCK PAPER SCISSORS ===${NC}"
    echo "  [1] BATU"
    echo "  [2] KERTAS"
    echo "  [3] GUNTING"
    echo "  [0] Kembali"
    read -p "Pilih: " p
    [ "$p" == "0" ] && { menu_game; return; }
    [ "$p" != "1" ] && [ "$p" != "2" ] && [ "$p" != "3" ] && { sleep 1; game_rps; }
    nama=("BATU" "KERTAS" "GUNTING")
    pp=$((p-1)); ap=$((RANDOM % 3))
    echo ""
    echo -e "  KAMU : ${GREEN}${nama[$pp]}${NC}"
    echo -e "  AI   : ${RED}${nama[$ap]}${NC}"
    echo ""
    if [ $pp -eq $ap ]; then echo -e "${YELLOW}SERI!${NC}"
    elif { [ $pp -eq 0 ] && [ $ap -eq 2 ]; } || { [ $pp -eq 1 ] && [ $ap -eq 0 ]; } || { [ $pp -eq 2 ] && [ $ap -eq 1 ]; }; then
        echo -e "${GREEN}MENANG!${NC}"
    else echo -e "${RED}KALAH!${NC}"; fi
    read -p "Enter main lagi..."; game_rps
}

game_slot() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== SLOT MACHINE ===${NC}"
    coin=100
    simbol=("7" "X" "O" "@" "*" "#")
    while [ $coin -gt 0 ]; do
        echo -e "Coin: ${GREEN}$coin${NC}"
        echo "  [1] Spin (-10)"
        echo "  [0] Keluar"
        read -p "Pilih: " s
        [ "$s" == "0" ] && { menu_game; return; }
        [ "$s" != "1" ] && continue
        coin=$((coin-10)); sleep 1
        s1=${simbol[$((RANDOM % 6))]}; s2=${simbol[$((RANDOM % 6))]}; s3=${simbol[$((RANDOM % 6))]}
        echo ""
        echo "  +-----------+"
        echo "  |  $s1 | $s2 | $s3  |"
        echo "  +-----------+"
        if [ "$s1" == "$s2" ] && [ "$s2" == "$s3" ]; then
            if [ "$s1" == "7" ]; then echo -e "${GREEN}JACKPOT +100!${NC}"; coin=$((coin+100))
            else echo -e "${GREEN}MENANG +50!${NC}"; coin=$((coin+50)); fi
        elif [ "$s1" == "$s2" ] || [ "$s2" == "$s3" ] || [ "$s1" == "$s3" ]; then
            echo -e "${YELLOW}2 sama +20${NC}"; coin=$((coin+20))
        else echo -e "${RED}Zonk!${NC}"; fi
        read -p "Enter lanjut..."
        clear; tampilkan_banner; echo -e "${CYAN}=== SLOT ===${NC}"
    done
    echo -e "${RED}Coin habis!${NC}"
    read -p "Enter..."; menu_game
}

game_tebak() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== TEBAK ANGKA ===${NC}"
    echo -e "${YELLOW}Aku pikir angka 1-100!${NC}"
    target=$((RANDOM % 100 + 1))
    coba=0
    while true; do
        read -p "Tebak (0=keluar): " t
        [ "$t" == "0" ] && { menu_game; return; }
        ! [[ "$t" =~ ^[0-9]+$ ]] && continue
        coba=$((coba+1))
        if [ $t -eq $target ]; then
            echo -e "${GREEN}BENAR! Angka: $target (dalam $coba kali)${NC}"
            read -p "Enter main lagi..."; game_tebak; return
        elif [ $t -lt $target ]; then echo -e "${YELLOW}Terlalu KECIL!${NC}"
        else echo -e "${YELLOW}Terlalu BESAR!${NC}"; fi
    done
}

menu_utama
