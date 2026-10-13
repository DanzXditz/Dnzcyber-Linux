#!/bin/bash

# ==========================================
#   Dnzcyber Linux v10.2 (With Updater)
#   Silent. Stealth. Secure.
# ==========================================

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
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
    if command -v gobuster &> /dev/null; then GO_ST="${GREEN}OK${NC}"; else GO_ST="${RED}--${NC}"; fi
    if [ -d "otp" ]; then OTP_ST="${GREEN}OK${NC}"; else OTP_ST="${RED}--${NC}"; fi
    if [ -d "NumInfo" ]; then NUM_ST="${GREEN}OK${NC}"; else NUM_ST="${RED}--${NC}"; fi
}

cek_keluar() {
    if [ "$1" == "0" ] || [ "$1" == "menu" ] || [ "$1" == "back" ]; then
        return 0
    fi
    return 1
}

menu_utama() {
    tampilkan_banner
    cek_tools
    
    echo -e "${CYAN}===========================================${NC}"
    echo -e "${GREEN}          Dnzcyber Linux v10.2${NC}"
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
    echo -e "  ${YELLOW}[10]${NC}  Gobuster (Directory Scan)  ${GO_ST}"
    echo -e "  ${YELLOW}[11]${NC}  Lacak IP Address"
    echo -e "  ${YELLOW}[12]${NC}  Info Nomor HP/WA (OSINT)   ${NUM_ST}"
    echo -e "  ${YELLOW}[13]${NC}  OTP WhatsApp               ${OTP_ST}"
    echo -e "  ${YELLOW}[14]${NC}  Custom Command Runner"
    echo -e "  ${YELLOW}[15]${NC}  Update Dnzcyber"
    echo -e "  ${YELLOW}[16]${NC}  Keluar"
    echo ""
    echo -e "${CYAN}===========================================${NC}"
    echo -e "${YELLOW}Ketik '0' di dalam workspace untuk kembali.${NC}"
    echo ""
    read -p "Pilih menu (1-16): " pilihan

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
        16) echo -e "${RED}Keluar dari Dnzcyber...${NC}"; exit ;;
        *) echo -e "${RED}Pilihan tidak valid!${NC}"; sleep 2; menu_utama ;;
    esac
}

# ==========================================
#   SETUP & INSTALL
# ==========================================
menu_setup() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== SETUP & INSTALL TOOLS ===${NC}"
    echo ""
    echo "  [1] Update & Upgrade Sistem"
    echo "  [2] Install Tools Dasar (Git, Python, Nano)"
    echo "  [3] Install Nmap"
    echo "  [4] Install SQLMap"
    echo "  [5] Install Wafw00f"
    echo "  [6] Install Whois & DNS Tools"
    echo "  [7] Install Netcat"
    echo "  [8] Install Gobuster"
    echo "  [9] INSTALL SEMUA (Recommended)"
    echo "  [0] Kembali ke Menu Utama"
    echo ""
    read -p "Pilih (0-9): " setup_pil

    case $setup_pil in
        1) clear; loading "Update Sistem"; pkg update -y && pkg upgrade -y
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        2) clear; loading "Install Git, Python, Nano"; pkg install -y git python nano
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        3) clear; loading "Install Nmap"; pkg install -y nmap
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        4) clear; loading "Install SQLMap"; pip install sqlmap
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        5) clear; loading "Install Wafw00f"; pip install wafw00f
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        6) clear; loading "Install Whois & DNS"; pkg install -y whois dnsutils
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        7) clear; loading "Install Netcat"; pkg install -y netcat-openbsd
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        8) clear; loading "Install Gobuster"; pkg install -y golang
           go install github.com/OJ/gobuster/v3@latest
           echo -e "${GREEN}[+] Selesai!${NC}"; read -p "Enter..."; menu_setup ;;
        9) clear
           loading "Update Sistem"; pkg update -y && pkg upgrade -y
           loading "Install Tools Dasar"; pkg install -y git python nano
           loading "Install Nmap"; pkg install -y nmap
           loading "Install SQLMap"; pip install sqlmap
           loading "Install Wafw00f"; pip install wafw00f
           loading "Install Whois & DNS"; pkg install -y whois dnsutils
           loading "Install Netcat"; pkg install -y netcat-openbsd
           echo -e "${GREEN}[+] SEMUA TOOLS SELESAI!${NC}"
           read -p "Enter..."; menu_setup ;;
        0) menu_utama ;;
        *) echo -e "${RED}Pilihan tidak valid!${NC}"; sleep 2; menu_setup ;;
    esac
}

# ==========================================
#   WORKSPACE NMAP
# ==========================================
ws_nmap() {
    clear; tampilkan_banner
    if ! command -v nmap &> /dev/null; then
        echo -e "${RED}[!] Nmap belum terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== NMAP WORKSPACE ===${NC}"
    echo ""
    echo "  [1] Quick Scan (port umum)"
    echo "  [2] Service Scan (deteksi versi)"
    echo "  [3] OS Detection"
    echo "  [4] Aggressive Scan (lengkap)"
    echo "  [5] Scan Subnet /24"
    echo "  [6] Custom Command"
    echo "  [0] Kembali"
    echo ""
    read -p "Pilih: " pil

    case $pil in
        1|2|3|4|5|6)
            echo ""
            if [ "$pil" == "5" ]; then
                echo -e "${YELLOW}Contoh: 192.168.1.0/24${NC}"
                read -p "Subnet: " target
            else
                echo -e "${YELLOW}Contoh: scanme.nmap.org atau 8.8.8.8${NC}"
                read -p "Target (0 = kembali): " target
            fi
            cek_keluar "$target" && menu_utama
            if [ -z "$target" ]; then
                echo -e "${RED}[!] Kosong.${NC}"; sleep 1; ws_nmap
            fi
            clear; loading "Scanning $target"
            echo -e "${CYAN}-------------------------------------${NC}"
            case $pil in
                1) nmap -F "$target" ;;
                2) nmap -sV "$target" ;;
                3) nmap -O "$target" ;;
                4) nmap -A "$target" ;;
                5) nmap -sn "$target" ;;
                6) read -p "Command nmap (tanpa 'nmap'): " c
                   cek_keluar "$c" && menu_utama
                   nmap $c ;;
            esac
            echo -e "${CYAN}-------------------------------------${NC}"
            echo ""
            read -p "Enter untuk scan lagi, atau '0' untuk menu utama: " l
            cek_keluar "$l" && menu_utama
            ws_nmap ;;
        0) menu_utama ;;
        *) echo -e "${RED}Invalid!${NC}"; sleep 1; ws_nmap ;;
    esac
}

# ==========================================
#   WORKSPACE SQLMAP
# ==========================================
ws_sqlmap() {
    clear; tampilkan_banner
    if ! command -v sqlmap &> /dev/null; then
        echo -e "${RED}[!] SQLMap belum terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== SQLMAP WORKSPACE ===${NC}"
    echo -e "${YELLOW}Target legal: http://testphp.vulnweb.com/artists.php?artist=1${NC}"
    echo ""
    echo "  [1] Basic Scan"
    echo "  [2] Enumerate Databases"
    echo "  [3] Enumerate Tables"
    echo "  [4] Dump Table Data"
    echo "  [0] Kembali"
    echo ""
    read -p "Pilih: " pil
    cek_keluar "$pil" && menu_utama
    case $pil in
        1|2|3|4)
            echo ""
            read -p "URL Target (0 = kembali): " u
            cek_keluar "$u" && menu_utama
            [ -z "$u" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_sqlmap; }
            case $pil in
                1) clear; loading "Basic Scan"; echo -e "${CYAN}-----${NC}"
                   sqlmap -u "$u" --batch ;;
                2) clear; loading "Enum DB"; echo -e "${CYAN}-----${NC}"
                   sqlmap -u "$u" --dbs --batch ;;
                3) read -p "Database: " d; cek_keluar "$d" && menu_utama
                   clear; loading "Enum Tables"; echo -e "${CYAN}-----${NC}"
                   sqlmap -u "$u" -D "$d" --tables --batch ;;
                4) read -p "Database: " d; read -p "Tabel: " t
                   clear; loading "Dump $t"; echo -e "${CYAN}-----${NC}"
                   sqlmap -u "$u" -D "$d" -T "$t" --dump --batch ;;
            esac
            echo -e "${CYAN}-----${NC}"
            read -p "Enter lanjut, atau '0' untuk menu: " l
            cek_keluar "$l" && menu_utama
            ws_sqlmap ;;
        0) menu_utama ;;
        *) echo -e "${RED}Invalid!${NC}"; sleep 1; ws_sqlmap ;;
    esac
}

# ==========================================
#   WORKSPACE WAFW00F
# ==========================================
ws_waf() {
    clear; tampilkan_banner
    if ! command -v wafw00f &> /dev/null; then
        echo -e "${RED}[!] Wafw00f belum terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== WAFW00F WORKSPACE ===${NC}"
    echo -e "${YELLOW}Contoh: https://www.cloudflare.com${NC}"
    echo ""
    read -p "URL Target (0 = kembali): " u
    cek_keluar "$u" && menu_utama
    [ -z "$u" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_waf; }
    clear; loading "Analisis WAF"
    echo -e "${CYAN}-----${NC}"; wafw00f "$u"
    echo -e "${CYAN}-----${NC}"
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_waf
}

# ==========================================
#   WORKSPACE WHOIS
# ==========================================
ws_whois() {
    clear; tampilkan_banner
    if ! command -v whois &> /dev/null; then
        echo -e "${RED}[!] Whois belum terinstall. Kembali ke menu 1.${NC}"
        read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== WHOIS LOOKUP ===${NC}"
    echo -e "${YELLOW}Contoh: google.com${NC}"
    echo ""
    read -p "Domain (0 = kembali): " d
    cek_keluar "$d" && menu_utama
    [ -z "$d" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_whois; }
    clear; loading "Whois $d"
    echo -e "${CYAN}-----${NC}"; whois "$d" 2>/dev/null | head -50
    echo -e "${CYAN}-----${NC}"
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_whois
}

# ==========================================
#   WORKSPACE DNS
# ==========================================
ws_dns() {
    clear; tampilkan_banner
    if ! command -v dig &> /dev/null; then
        echo -e "${RED}[!] DNS tools belum terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== DNS LOOKUP ===${NC}"
    echo -e "${YELLOW}Contoh: google.com${NC}"
    echo ""
    read -p "Domain (0 = kembali): " d
    cek_keluar "$d" && menu_utama
    [ -z "$d" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_dns; }
    clear
    echo -e "${CYAN}--- A Records ---${NC}"; dig +short "$d" A
    echo -e "${CYAN}--- MX Records ---${NC}"; dig +short "$d" MX
    echo -e "${CYAN}--- NS Records ---${NC}"; dig +short "$d" NS
    echo -e "${CYAN}--- TXT Records ---${NC}"; dig +short "$d" TXT | head -5
    echo ""
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_dns
}

# ==========================================
#   WORKSPACE REVERSE DNS & PING
# ==========================================
ws_revdns_ping() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== REVERSE DNS & PING ===${NC}"
    echo ""
    echo "  [1] Reverse DNS (IP -> Hostname)"
    echo "  [2] Ping"
    echo "  [3] Traceroute"
    echo "  [0] Kembali"
    echo ""
    read -p "Pilih: " pil
    cek_keluar "$pil" && menu_utama
    case $pil in
        1) read -p "IP (0 = kembali): " ip
           cek_keluar "$ip" && menu_utama
           clear; loading "Reverse DNS"
           echo -e "${CYAN}-----${NC}"; dig -x "$ip" +short
           echo -e "${CYAN}-----${NC}" ;;
        2) read -p "Host/IP (0 = kembali): " h
           cek_keluar "$h" && menu_utama
           read -p "Jumlah ping (default 4): " n
           [ -z "$n" ] && n=4
           clear; loading "Ping $h"
           echo -e "${CYAN}-----${NC}"; ping -c "$n" "$h"
           echo -e "${CYAN}-----${NC}" ;;
        3) read -p "Host/IP (0 = kembali): " h
           cek_keluar "$h" && menu_utama
           clear; loading "Traceroute"
           echo -e "${CYAN}-----${NC}"; traceroute "$h" 2>/dev/null || echo "Traceroute tidak ada. Coba: pkg install traceroute"
           echo -e "${CYAN}-----${NC}" ;;
        0) menu_utama ;;
        *) echo -e "${RED}Invalid!${NC}"; sleep 1; ws_revdns_ping ;;
    esac
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_revdns_ping
}

# ==========================================
#   WORKSPACE HTTP HEADERS
# ==========================================
ws_http() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== HTTP HEADERS ANALYZER ===${NC}"
    echo -e "${YELLOW}Contoh: https://google.com${NC}"
    echo ""
    read -p "URL (0 = kembali): " u
    cek_keluar "$u" && menu_utama
    [ -z "$u" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_http; }
    [[ "$u" != http* ]] && u="https://$u"
    clear; loading "Ambil headers"
    echo -e "${CYAN}-----${NC}"; curl -sIL "$u"
    echo -e "${CYAN}-----${NC}"
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_http
}

# ==========================================
#   WORKSPACE NETCAT
# ==========================================
ws_netcat() {
    clear; tampilkan_banner
    if ! command -v nc &> /dev/null; then
        echo -e "${RED}[!] Netcat belum terinstall.${NC}"; read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== NETCAT (Port Connect) ===${NC}"
    echo -e "${YELLOW}Contoh: google.com port 443${NC}"
    echo ""
    read -p "Host/IP (0 = kembali): " h
    cek_keluar "$h" && menu_utama
    read -p "Port: " p
    cek_keluar "$p" && menu_utama
    clear; loading "Cek $h:$p"
    echo -e "${CYAN}-----${NC}"; timeout 5 nc -zv "$h" "$p" 2>&1
    echo -e "${CYAN}-----${NC}"
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_netcat
}

# ==========================================
#   WORKSPACE GOBUSTER
# ==========================================
ws_gobuster() {
    clear; tampilkan_banner
    if ! command -v gobuster &> /dev/null; then
        echo -e "${RED}[!] Gobuster tidak ditemukan.${NC}"
        echo -e "${YELLOW}Install lewat menu 1 -> opsi 8.${NC}"
        read -p "Enter..."; menu_utama
    fi
    echo -e "${CYAN}=== GOBUSTER (Directory Scan) ===${NC}"
    echo ""
    read -p "URL Target (0 = kembali): " u
    cek_keluar "$u" && menu_utama
    [ -z "$u" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_gobuster; }
    echo ""
    echo -e "${YELLOW}Path wordlist default: /usr/share/wordlists/dirb/common.txt${NC}"
    read -p "Path (Enter = default): " w
    [ -z "$w" ] && w="/usr/share/wordlists/dirb/common.txt"
    if [ ! -f "$w" ]; then
        echo -e "${YELLOW}[!] Wordlist gak ada. Download?${NC}"
        read -p "(y/n): " dl
        if [[ "$dl" == "y" ]]; then
            mkdir -p /usr/share/wordlists/dirb
            curl -sL "https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt" -o "$w"
        fi
    fi
    clear; loading "Scan $u"
    echo -e "${CYAN}-----${NC}"
    gobuster dir -u "$u" -w "$w" -t 20 --timeout 10s 2>&1 | head -40
    echo -e "${CYAN}-----${NC}"
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_gobuster
}

# ==========================================
#   LACAK IP
# ==========================================
fitur_lacak_ip() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== LACAK IP ADDRESS ===${NC}"
    echo ""
    read -p "IP Target (0 = kembali, Enter = IP sendiri): " target_ip
    cek_keluar "$target_ip" && menu_utama
    [ -z "$target_ip" ] && target_ip=$(curl -s ifconfig.me)
    loading "Melacak $target_ip"
    response=$(curl -s "http://ip-api.com/json/$target_ip")
    if echo "$response" | grep -q '"status":"success"'; then
        echo "$response" | python -c "
import sys, json
try:
    d = json.load(sys.stdin)
    print('\033[1;36m========================================\033[0m')
    print('\033[1;32m     HASIL PELACAKAN IP ADDRESS\033[0m')
    print('\033[1;36m========================================\033[0m')
    print(f\"\033[1;33m  IP       :\033[0m {d.get('query','N/A')}\")
    print(f\"\033[1;33m  Negara   :\033[0m {d.get('country','N/A')}\")
    print(f\"\033[1;33m  Region   :\033[0m {d.get('regionName','N/A')}\")
    print(f\"\033[1;33m  Kota     :\033[0m {d.get('city','N/A')}\")
    print(f\"\033[1;33m  ISP      :\033[0m {d.get('isp','N/A')}\")
    lat, lon = d.get('lat',''), d.get('lon','')
    print(f\"\033[1;33m  Koordinat:\033[0m {lat}, {lon}\")
    print(f\"\033[1;36m  Maps     : https://maps.google.com/?q={lat},{lon}\033[0m\")
except: pass
"
    else
        echo -e "${RED}[!] Gagal. Cek format IP.${NC}"
    fi
    echo ""
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    fitur_lacak_ip
}

# ==========================================
#   INFO NOMOR
# ==========================================
fitur_info_nomor() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== INFO NOMOR HP/WA (OSINT) ===${NC}"
    echo -e "${YELLOW}[i] Info operator & negara. BUKAN lokasi.${NC}"
    echo ""
    if [ ! -d "NumInfo" ]; then
        loading "Unduh NumInfo"
        git clone https://github.com/Anon4You/NumInfo.git NumInfo 2>/dev/null
        if [ ! -d "NumInfo" ]; then
            echo -e "${RED}[!] Gagal unduh.${NC}"; read -p "Enter..."; menu_utama
        fi
        cd NumInfo && pip install -r requirements.txt 2>/dev/null; cd ..
    fi
    read -p "Nomor (contoh: +6281234567890, 0 = kembali): " nomor
    cek_keluar "$nomor" && menu_utama
    [ -z "$nomor" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; fitur_info_nomor; }
    loading "Analisis $nomor"
    cd NumInfo
    [ -f "numinfo.py" ] && python numinfo.py "$nomor" || \
    [ -f "main.py" ] && python main.py "$nomor" || \
    echo -e "${RED}[!] File utama tidak ditemukan.${NC}"
    cd ..
    echo ""
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    fitur_info_nomor
}

# ==========================================
#   OTP WHATSAPP
# ==========================================
fitur_otp() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== OTP WHATSAPP ===${NC}"
    echo ""
    if [ ! -d "otp" ]; then
        loading "Unduh Tool OTP"
        git clone https://github.com/him0x/otp.git otp 2>/dev/null
        if [ ! -d "otp" ]; then
            echo -e "${RED}[!] Gagal unduh.${NC}"; read -p "Enter..."; menu_utama
        fi
    fi
    cd otp
    [ -f "requirements.txt" ] && pip install -r requirements.txt 2>/dev/null
    echo -e "${GREEN}[+] Menjalankan Tool OTP...${NC}"
    echo -e "${CYAN}-----${NC}"
    [ -f "main.py" ] && python main.py || echo -e "${RED}[!] main.py tidak ada.${NC}"
    cd ..
    echo -e "${CYAN}-----${NC}"
    read -p "Enter untuk kembali ke menu..."; menu_utama
}

# ==========================================
#   CUSTOM COMMAND RUNNER
# ==========================================
ws_custom() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== CUSTOM COMMAND RUNNER ===${NC}"
    echo -e "${YELLOW}Ketik command apapun. Ketik '0' untuk kembali.${NC}"
    echo -e "${YELLOW}Contoh: nmap -sV scanme.nmap.org${NC}"
    echo ""
    read -p "> " cmd
    cek_keluar "$cmd" && menu_utama
    [ -z "$cmd" ] && { echo -e "${RED}Kosong!${NC}"; sleep 1; ws_custom; }
    clear
    echo -e "${CYAN}--- Running: $cmd${NC}"
    echo -e "${CYAN}-----${NC}"
    eval "$cmd"
    echo -e "${CYAN}-----${NC}"
    echo ""
    read -p "Enter lanjut, atau '0' untuk menu: " l
    cek_keluar "$l" && menu_utama
    ws_custom
}

# ==========================================
#   UPDATE DNZCYBER
# ==========================================
do_update() {
    clear; tampilkan_banner
    echo -e "${CYAN}=== UPDATE DNZCYBER ===${NC}"
    echo ""
    
    # Cek apakah di folder install standar
    if [ ! -d "$INSTALL_DIR/.git" ]; then
        echo -e "${YELLOW}[i] Folder install standar tidak ditemukan.${NC}"
        echo -e "${YELLOW}    Coba cek di folder tempat script ini berada...${NC}"
        echo ""
        cd "$(dirname "$0")" 2>/dev/null
        
        if [ ! -d ".git" ]; then
            echo -e "${RED}[!] Bukan folder git. Update otomatis tidak tersedia.${NC}"
            echo -e "${YELLOW}    Download manual dari GitHub.${NC}"
            read -p "Enter..."; menu_utama
        fi
    else
        cd "$INSTALL_DIR"
    fi
    
    echo -e "${YELLOW}[*] Cek update dari GitHub...${NC}"
    git fetch origin 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}[!] Gagal terhubung ke GitHub. Cek koneksi.${NC}"
        read -p "Enter..."; menu_utama
    fi
    
    LOCAL=$(git rev-parse HEAD 2>/dev/null)
    REMOTE=$(git rev-parse origin/main 2>/dev/null)
    
    if [ -z "$REMOTE" ]; then
        REMOTE=$(git rev-parse origin/master 2>/dev/null)
    fi
    
    if [ "$LOCAL" == "$REMOTE" ]; then
        echo -e "${GREEN}[+] Dnzcyber sudah versi terbaru!${NC}"
    else
        echo -e "${YELLOW}[*] Ada update baru. Mendownload...${NC}"
        git reset --hard origin/main 2>/dev/null || git reset --hard origin/master 2>/dev/null
        
        if [ $? -eq 0 ]; then
            chmod +x dnz.sh 2>/dev/null
            echo -e "${GREEN}[+] Update berhasil!${NC}"
            echo -e "${YELLOW}[i] Restart Dnzcyber untuk pakai versi baru.${NC}"
            read -p "Tekan Enter untuk restart..."
            exec ./dnz.sh
        else
            echo -e "${RED}[!] Update gagal.${NC}"
        fi
    fi
    
    echo ""
    read -p "Enter untuk kembali ke menu..."; menu_utama
}

# Jalankan
menu_utama
