#!/bin/bash
GREEN='\033[1;32m'; RED='\033[1;31m'; CYAN='\033[1;36m'; YELLOW='\033[1;33m'; NC='\033[0m'
INSTALL_DIR="$HOME/.dnzcyber"

loading() { echo -n -e "${YELLOW}[*] $1 ${NC}"; for i in {1..3}; do echo -n "."; sleep 0.5; done; echo ""; }
banner() {
clear
echo -e "${GREEN}"
echo "  ____  _   _ ______   _______     __"
echo " |  _ \| \ | |___  /  / ____\ \   / /"
echo " | | | |  \| |  / /  | |     \ \_/ / "
echo " | |_| | |\  | / /__ | |___   \   /  "
echo " |____/|_| \_/_____|  \_____|  |_|   "
echo -e "${NC}----------------------------------------"
echo -e "${CYAN}   Dnzcyber Linux v15.1${NC}"
echo "----------------------------------------"
}
cek_keluar() { [ "$1" == "0" ] || [ "$1" == "menu" ] && return 0; return 1; }
cek_debian() { proot-distro login debian -- bash -c "echo ok" &>/dev/null; }

menu_utama() {
    banner
    cek_debian && DST="${GREEN}OK${NC}" || DST="${RED}--${NC}"
    echo ""
    echo -e "  ${YELLOW}[01]${NC} Setup & Install Tools"
    echo -e "  ${YELLOW}[02]${NC} Nmap Workspace"
    echo -e "  ${YELLOW}[03]${NC} SQLMap Workspace"
    echo -e "  ${YELLOW}[04]${NC} Wafw00f Workspace"
    echo -e "  ${YELLOW}[05]${NC} Whois Lookup"
    echo -e "  ${YELLOW}[06]${NC} DNS Lookup"
    echo -e "  ${YELLOW}[07]${NC} Reverse DNS / Ping"
    echo -e "  ${YELLOW}[08]${NC} HTTP Headers"
    echo -e "  ${YELLOW}[09]${NC} Netcat"
    echo -e "  ${YELLOW}[10]${NC} Gobuster"
    echo -e "  ${YELLOW}[11]${NC} Lacak IP Address"
    echo -e "  ${YELLOW}[12]${NC} Info Nomor HP/WA (OSINT)"
    echo -e "  ${YELLOW}[13]${NC} OTP WhatsApp"
    echo -e "  ${YELLOW}[14]${NC} Custom Command"
    echo -e "  ${YELLOW}[15]${NC} Update Dnzcyber"
    echo -e "  ${YELLOW}[16]${NC} Game Zone"
    echo -e "  ${YELLOW}[17]${NC} Debian Proot       ${DST}"
    echo -e "  ${YELLOW}[18]${NC} Cek IP Sendiri"
    echo -e "  ${YELLOW}[19]${NC} OP Tools (Recon & OSINT)"
    echo -e "  ${YELLOW}[20]${NC} Animasi Full Screen"
    echo -e "  ${YELLOW}[21]${NC} Keluar"
    echo ""
    read -p "  Pilih (1-21): " p
    case $p in
        1|01) setup ;; 2|02) nmap_ws ;; 3|03) sqlmap_ws ;; 4|04) waf_ws ;;
        5|05) whois_ws ;; 6|06) dns_ws ;; 7|07) revdns_ws ;; 8|08) http_ws ;;
        9|09) nc_ws ;; 10) gobuster_ws ;; 11) lacak_ip ;; 12) info_nomor ;;
        13) otp ;; 14) custom ;; 15) update ;; 16) menu_game ;; 17) proot_mode ;;
        18) cek_ip_sendiri ;; 19) op_tools ;; 20) animasi_full ;;
        21) echo -e "${RED}Keluar...${NC}"; exit ;;
        *) sleep 1; menu_utama ;;
    esac
}

op_tools() {
clear; banner
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}       OP TOOLS - Recon & OSINT${NC}"
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo ""
echo -e "  ${YELLOW}[1]${NC}  Subdomain Finder"
echo -e "  ${YELLOW}[2]${NC}  Email Breach Check"
echo -e "  ${YELLOW}[3]${NC}  Username Hunter (20 platform)"
echo -e "  ${YELLOW}[4]${NC}  SSL Certificate Checker"
echo -e "  ${YELLOW}[5]${NC}  Wayback Machine"
echo -e "  ${YELLOW}[6]${NC}  Hash Identifier"
echo -e "  ${YELLOW}[7]${NC}  Password Generator"
echo -e "  ${YELLOW}[8]${NC}  Port Scanner"
echo -e "  ${YELLOW}[0]${NC}  Kembali"
read -p "Pilih (0-8): " o
case $o in
    1) read -p "Domain: " d; clear; python ~/.dnzcyber/op_tools.py subdomain "$d" ;;
    2) read -p "Email: " e; clear; python ~/.dnzcyber/op_tools.py email "$e" ;;
    3) read -p "Username: " u; clear; python ~/.dnzcyber/op_tools.py username "$u" ;;
    4) read -p "Domain: " s; clear; python ~/.dnzcyber/op_tools.py ssl "$s" ;;
    5) read -p "Domain: " w; clear; python ~/.dnzcyber/op_tools.py wayback "$w" ;;
    6) read -p "Hash: " h; clear; python ~/.dnzcyber/op_tools.py hash "$h" ;;
    7) read -p "Panjang (16): " l; [ -z "$l" ] && l=16; clear; python ~/.dnzcyber/op_tools.py passgen "$l" ;;
    8) read -p "IP/Domain: " t; clear; python ~/.dnzcyber/op_tools.py portscan "$t" ;;
    0) menu_utama ;;
esac
echo ""
read -p "Enter lanjut, atau '0' untuk menu: " l
[ "$l" == "0" ] && menu_utama
op_tools
}

animasi_full() {
    clear
    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
    echo -e "${GREEN}          ANIMASI FULL SCREEN${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
    echo ""
    echo -e "  ${YELLOW}[1]${NC}  Parrot"
    echo -e "  ${YELLOW}[2]${NC}  Nyan Cat"
    echo -e "  ${YELLOW}[3]${NC}  Donut"
    echo -e "  ${YELLOW}[4]${NC}  Kitty"
    echo -e "  ${YELLOW}[5]${NC}  Anime Dance"
    echo -e "  ${YELLOW}[6]${NC}  Api"
    echo -e "  ${YELLOW}[0]${NC}  Kembali"
    echo ""
    read -p "Pilih: " a
    case $a in
        1) clear; curl -s ascii.live/parrot ;;
        2) clear; curl -s ascii.live/nyan ;;
        3) clear; curl -s ascii.live/donut ;;
        4) clear; curl -s ascii.live/kitty ;;
        5) clear; bash ~/.dnzcyber/anime_dance.sh 2>/dev/null || echo "File tidak ada" ;;
        6) clear; cacafire 2>/dev/null || echo "Install: pkg install libcaca" ;;
        0) menu_utama ;;
    esac
    menu_utama
}

otp() {
clear; banner
echo -e "${CYAN}=== OTP WHATSAPP ===${NC}"
echo -e "${RED}[!] KETIK Y LALU ENTER FITUR SPAMER SMS!${NC}"
echo ""
read -p "Lanjut? (y/n): " yn
[ "$yn" != "y" ] && { menu_utama; return; }
if [ ! -d "otp" ]; then
    loading "Unduh OTP Tool"
    git clone https://github.com/him0x/otp.git otp 2>/dev/null
fi
if [ ! -d "otp" ]; then
    echo -e "${RED}[!] Gagal unduh. Cek koneksi.${NC}"
    read -p "Enter..."; menu_utama; return
fi
cd otp
[ -f "requirements.txt" ] && pip install -r requirements.txt 2>/dev/null
echo -e "${GREEN}[+] Menjalankan Tool OTP...${NC}"
echo -e "${CYAN}─────────────────────────────────${NC}"
[ -f "main.py" ] && python main.py || echo -e "${RED}[!] main.py tidak ada${NC}"
cd ..
echo ""
echo -e "${CYAN}─────────────────────────────────${NC}"
read -p "Enter untuk kembali..."; menu_utama
}

setup() {
clear; banner
echo " [1] Update  [2] Dasar  [3] Nmap  [4] SQLMap"
echo " [5] Wafw00f  [6] Whois+DNS  [7] Netcat  [8] SEMUA  [0] Kembali"
read -p "Pilih: " s
case $s in
1) pkg update -y && pkg upgrade -y; read -p "Enter..."; setup ;;
2) pkg install -y git python nano coreutils; read -p "Enter..."; setup ;;
3) pkg install -y nmap; read -p "Enter..."; setup ;;
4) pip install sqlmap; read -p "Enter..."; setup ;;
5) pip install wafw00f; read -p "Enter..."; setup ;;
6) pkg install -y whois dnsutils; read -p "Enter..."; setup ;;
7) pkg install -y netcat-openbsd; read -p "Enter..."; setup ;;
8) pkg update -y && pkg upgrade -y
   pkg install -y git python nano coreutils nmap whois dnsutils netcat-openbsd
   pip install sqlmap wafw00f
   read -p "Enter..."; setup ;;
0) menu_utama ;; *) sleep 1; setup ;;
esac
}
nmap_ws() {
clear; banner
command -v nmap &>/dev/null || { echo "Nmap belum install"; read -p "Enter..."; menu_utama; }
echo " [1] Quick [2] Service [3] OS [4] Aggressive [5] Subnet [6] Custom [0] Kembali"
read -p "Pilih: " pil
case $pil in
1|2|3|4|5|6)
read -p "Target: " t
cek_keluar "$t" && menu_utama
[ -z "$t" ] && { sleep 1; nmap_ws; }
clear; loading "Scanning $t"
case $pil in
1) nmap -F "$t" ;; 2) nmap -sV "$t" ;; 3) nmap -O "$t" ;;
4) nmap -A "$t" ;; 5) nmap -sn "$t" ;; 6) read -p "Cmd: " c; nmap $c ;;
esac
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
nmap_ws ;; 0) menu_utama ;; *) sleep 1; nmap_ws ;;
esac
}
sqlmap_ws() {
clear; banner
command -v sqlmap &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
echo " [1] Basic [2] DBs [3] Tables [4] Dump [0] Kembali"
read -p "Pilih: " pil
case $pil in
1|2|3|4)
read -p "URL: " u
cek_keluar "$u" && menu_utama
[ -z "$u" ] && { sleep 1; sqlmap_ws; }
case $pil in
1) sqlmap -u "$u" --batch ;; 2) sqlmap -u "$u" --dbs --batch ;;
3) read -p "DB: " d; sqlmap -u "$u" -D "$d" --tables --batch ;;
4) read -p "DB: " d; read -p "Tabel: " t; sqlmap -u "$u" -D "$d" -T "$t" --dump --batch ;;
esac
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
sqlmap_ws ;; 0) menu_utama ;; *) sleep 1; sqlmap_ws ;;
esac
}
waf_ws() {
clear; banner
command -v wafw00f &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
read -p "URL: " u
cek_keluar "$u" && menu_utama
clear; wafw00f "$u"
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
waf_ws
}
whois_ws() {
clear; banner
command -v whois &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
read -p "Domain: " d
cek_keluar "$d" && menu_utama
clear; whois "$d" 2>/dev/null | head -50
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
whois_ws
}
dns_ws() {
clear; banner
command -v dig &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
read -p "Domain: " d
cek_keluar "$d" && menu_utama
clear
echo -e "${CYAN}--- A ---${NC}"; dig +short "$d" A
echo -e "${CYAN}--- MX ---${NC}"; dig +short "$d" MX
echo -e "${CYAN}--- NS ---${NC}"; dig +short "$d" NS
echo -e "${CYAN}--- TXT ---${NC}"; dig +short "$d" TXT | head -5
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
dns_ws
}
revdns_ws() {
clear; banner
echo " [1] Reverse DNS [2] Ping [3] Traceroute [0] Kembali"
read -p "Pilih: " pil
case $pil in
1) read -p "IP: " ip; clear; dig -x "$ip" +short ;;
2) read -p "Host: " h; read -p "Jumlah: " n; [ -z "$n" ] && n=4; clear; ping -c "$n" "$h" ;;
3) read -p "Host: " h; clear; traceroute "$h" 2>/dev/null || echo "Install: pkg install traceroute" ;;
0) menu_utama ;;
esac
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
revdns_ws
}
http_ws() {
clear; banner
read -p "URL: " u
cek_keluar "$u" && menu_utama
[ -z "$u" ] && { sleep 1; http_ws; }
[[ "$u" != http* ]] && u="https://$u"
clear; curl -sIL "$u"
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
http_ws
}
nc_ws() {
clear; banner
command -v nc &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
read -p "Host: " h
cek_keluar "$h" && menu_utama
read -p "Port: " p
clear; timeout 5 nc -zv "$h" "$p" 2>&1
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
nc_ws
}
gobuster_ws() {
clear; banner
command -v gobuster &>/dev/null || { echo "Belum install"; read -p "Enter..."; menu_utama; }
read -p "URL: " u
cek_keluar "$u" && menu_utama
w="/usr/share/wordlists/dirb/common.txt"
[ ! -f "$w" ] && mkdir -p /usr/share/wordlists/dirb && curl -sL "https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt" -o "$w"
clear; gobuster dir -u "$u" -w "$w" -t 20 --timeout 10s 2>&1 | head -40
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
gobuster_ws
}
lacak_ip() {
clear; banner
echo -e "${CYAN}=== LACAK IP ===${NC}"
read -p "IP (kosong=sendiri): " tip
[ "$tip" == "0" ] && { menu_utama; return; }
if [ -z "$tip" ]; then
    loading "Ambil IPv4"
    tip=$(curl -4 -s ifconfig.me 2>/dev/null)
    [ -z "$tip" ] && { echo "Gagal"; read -p "Enter..."; lacak_ip; return; }
    echo -e "${GREEN}IP: $tip${NC}"
fi
echo ""
python ~/.dnzcyber/ip_tracker.py "$tip"
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
lacak_ip
}
cek_ip_sendiri() {
clear; banner
echo -e "${CYAN}=== CEK IP SENDIRI ===${NC}"
loading "Ambil IPv4"
IP4=$(curl -4 -s ifconfig.me 2>/dev/null)
[ -z "$IP4" ] && { echo "Gagal"; read -p "Enter..."; menu_utama; }
echo -e "${GREEN}IP: $IP4${NC}"
echo ""
python ~/.dnzcyber/ip_tracker.py "$IP4"
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
cek_ip_sendiri
}
info_nomor() {
clear; banner
echo -e "${CYAN}=== INFO NOMOR HP/WA ===${NC}"
echo -e "${YELLOW}[i] Info OSINT doang, BUKAN lacak lokasi${NC}"
echo ""
if [ ! -d "NumInfo" ]; then
    loading "Unduh NumInfo"
    git clone https://github.com/Anon4You/NumInfo.git NumInfo 2>/dev/null
    [ -d "NumInfo" ] && cd NumInfo && pip install -r requirements.txt 2>/dev/null && cd ..
fi
read -p "Nomor: " n
cek_keluar "$n" && menu_utama
[ -z "$n" ] && { sleep 1; info_nomor; }
cd NumInfo
[ -f "numinfo.py" ] && python numinfo.py "$n" 2>/dev/null
[ -f "main.py" ] && [ ! -f "numinfo.py" ] && python main.py "$n" 2>/dev/null
cd ..
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
info_nomor
}
custom() {
clear; banner
echo "Ketik '0' untuk kembali."
read -p "> " cmd
cek_keluar "$cmd" && menu_utama
[ -z "$cmd" ] && { sleep 1; custom; }
clear; eval "$cmd"
read -p "Enter, atau '0': " l
cek_keluar "$l" && menu_utama
custom
}
update() {
clear; banner
cd "$INSTALL_DIR" 2>/dev/null || cd "$(dirname "$0")"
git fetch origin 2>/dev/null
L=$(git rev-parse HEAD 2>/dev/null); R=$(git rev-parse origin/main 2>/dev/null)
if [ "$L" == "$R" ]; then echo -e "${GREEN}Sudah terbaru!${NC}"
else git reset --hard origin/main 2>/dev/null; chmod +x dnz.sh; echo -e "${GREEN}Updated!${NC}"; read -p "Enter restart..."; exec ./dnz.sh; fi
read -p "Enter..."; menu_utama
}
menu_game() {
clear; banner
echo " [1] Snake  [2] Quiz  [0] Kembali"
read -p "Pilih: " g
case $g in
1) python "$HOME/.dnzcyber/snake.py" 2>/dev/null || echo "snake.py tidak ada"; menu_game ;;
2) python "$HOME/.dnzcyber/quiz.py" 2>/dev/null || echo "quiz.py tidak ada"; menu_game ;;
0) menu_utama ;; *) menu_game ;;
esac
}
proot_mode() {
clear; banner
echo -e "${CYAN}=== DEBIAN PROOT ===${NC}"
cek_debian && K="${GREEN}[OK]${NC}" || K="${RED}[--]${NC}"
echo -e "  Status: ${K}"
echo ""
echo " [1] Install [2] Login [3] Install Tools [4] Cek [5] Reset [0] Kembali"
read -p "Pilih: " p
case $p in
1) clear
   cek_debian && { echo "Udah install"; read -p "Enter..."; proot_mode; }
   loading "Install proot-distro"; pkg install -y proot-distro
   loading "Download Debian"; proot-distro install debian
   echo -e "${GREEN}Selesai!${NC}"; read -p "Enter..."; proot_mode ;;
2) cek_debian || { echo "Belum install"; read -p "Enter..."; proot_mode; }
   clear; proot-distro login debian; read -p "Enter..."; proot_mode ;;
3) cek_debian || { echo "Belum install"; read -p "Enter..."; proot_mode; }
   echo " [1] Basic [2] Metasploit [3] Password [4] Web [5] SEMUA [0] Kembali"
   read -p "Pilih: " tp
   case $tp in
   1) proot-distro login debian -- bash -c "apt update && apt install -y nmap sqlmap whois dnsutils netcat-openbsd curl wget python3 python3-pip git" ;;
   2) proot-distro login debian -- bash -c "apt install -y metasploit-framework" ;;
   3) proot-distro login debian -- bash -c "apt install -y hydra john hashcat" ;;
   4) proot-distro login debian -- bash -c "apt install -y nikto gobuster dirb" ;;
   5) proot-distro login debian -- bash -c "apt update && apt install -y nmap sqlmap whois dnsutils netcat-openbsd curl wget python3 python3-pip git nikto gobuster dirb hydra john hashcat" ;;
   0) proot_mode ;;
   esac
   read -p "Enter..."; proot_mode ;;
4) cek_debian || { echo "Belum install"; read -p "Enter..."; proot_mode; }
   for t in nmap sqlmap msfconsole hydra john aircrack-ng nikto gobuster python3 git; do
     proot-distro login debian -- bash -c "command -v $t" &>/dev/null && echo -e "  ${GREEN}[OK]${NC} $t" || echo -e "  ${RED}[--]${NC} $t"
   done
   read -p "Enter..."; proot_mode ;;
5) read -p "Yakin hapus? (yes/no): " k
   [ "$k" = "yes" ] && { proot-distro remove debian; echo "Dihapus."; }
   read -p "Enter..."; proot_mode ;;
0) menu_utama ;; *) proot_mode ;;
esac
}
menu_utama
