#!/bin/bash

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

INSTALL_DIR="$HOME/.dnzcyber"

clear
echo -e "${CYAN}"
echo "  ____  _   _ ______   _______     __"
echo " |  _ \| \ | |___  /  / ____\ \   / /"
echo " | | | |  \| |  / /  | |     \ \_/ / "
echo " | |_| | |\  | / /__ | |___   \   /  "
echo " |____/|_| \_/_____|  \_____|  |_|   "
echo -e "${NC}"
echo -e "${CYAN}   Dnzcyber Linux - Updater${NC}"
echo "----------------------------------------"
echo ""

if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${RED}[!] Dnzcyber belum terinstall.${NC}"
    echo -e "${YELLOW}Jalankan installer dulu.${NC}"
    exit 1
fi

cd "$INSTALL_DIR"

echo -e "${YELLOW}[*] Cek update terbaru dari GitHub...${NC}"
git fetch origin 2>/dev/null

if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Gagal terhubung ke GitHub. Cek koneksi internet.${NC}"
    exit 1
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
        chmod +x "$INSTALL_DIR/dnz.sh" 2>/dev/null
        echo -e "${GREEN}[+] Update berhasil!${NC}"
        echo -e "${GREEN}    Versi terbaru sekarang aktif.${NC}"
    else
        echo -e "${RED}[!] Update gagal. Coba lagi nanti.${NC}"
    fi
fi

echo ""
echo -e "${YELLOW}[i] Ketik 'dnzcyber' untuk mulai pakai.${NC}"
echo ""
