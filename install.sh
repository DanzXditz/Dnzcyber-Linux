#!/bin/bash

# ==========================================
#   Dnzcyber Linux - Auto Installer
#   Silent. Stealth. Secure.
# ==========================================

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO_URL="https://github.com/DanzXditz/Dnzcyber-Linux.git"
INSTALL_DIR="$HOME/.dnzcyber"

clear
echo -e "${GREEN}"
echo "  ____  _   _ ______   _______     __"
echo " |  _ \| \ | |___  /  / ____\ \   / /"
echo " | | | |  \| |  / /  | |     \ \_/ / "
echo " | |_| | |\  | / /__ | |___   \   /  "
echo " |____/|_| \_/_____|  \_____|  |_|   "
echo -e "${NC}"
echo "----------------------------------------"
echo -e "${CYAN}   Dnzcyber Linux - Auto Installer${NC}"
echo "----------------------------------------"
echo ""

echo -e "${YELLOW}[1/7] Update & Upgrade sistem...${NC}"
pkg update -y 2>/dev/null && pkg upgrade -y 2>/dev/null

echo -e "${YELLOW}[2/7] Install tools dasar (git, python, nano, coreutils)...${NC}"
pkg install -y git python nano coreutils 2>/dev/null

echo -e "${YELLOW}[3/7] Minta akses penyimpanan...${NC}"
termux-setup-storage 2>/dev/null
sleep 2

echo -e "${YELLOW}[4/7] Download Dnzcyber dari GitHub...${NC}"
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}      Folder sudah ada, update ulang...${NC}"
    cd "$INSTALL_DIR"
    git fetch origin 2>/dev/null && git reset --hard origin/main 2>/dev/null
else
    git clone "$REPO_URL" "$INSTALL_DIR" 2>/dev/null
    if [ ! -d "$INSTALL_DIR" ]; then
        echo -e "${RED}[!] Gagal download. Cek koneksi & URL repo.${NC}"
        exit 1
    fi
fi

echo -e "${YELLOW}[5/7] Set izin akses file...${NC}"
chmod +x "$INSTALL_DIR/dnz.sh" 2>/dev/null
chmod +x "$INSTALL_DIR/update.sh" 2>/dev/null
chmod +x "$INSTALL_DIR/install.sh" 2>/dev/null

# Copy Python game files ke folder hidden
cp "$INSTALL_DIR/snake.py" "$HOME/.dnzcyber/" 2>/dev/null
cp "$INSTALL_DIR/quiz.py" "$HOME/.dnzcyber/" 2>/dev/null

echo -e "${YELLOW}[6/7] Install Python tools (sqlmap, wafw00f)...${NC}"
pip install sqlmap wafw00f 2>/dev/null

echo -e "${YELLOW}[7/7] Setup shortcut command...${NC}"
BASHRC="$HOME/.bashrc"

sed -i '/# Dnzcyber alias/d' "$BASHRC" 2>/dev/null
sed -i '/alias dnzcyber=/d' "$BASHRC" 2>/dev/null
sed -i '/alias dnzcyber-update=/d' "$BASHRC" 2>/dev/null

echo "" >> "$BASHRC"
echo "# Dnzcyber alias" >> "$BASHRC"
echo "alias dnzcyber='cd $INSTALL_DIR && chmod +x dnz.sh && ./dnz.sh'" >> "$BASHRC"
echo "alias dnzcyber-update='cd $INSTALL_DIR && bash update.sh'" >> "$BASHRC"

source "$BASHRC" 2>/dev/null

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}     INSTALASI BERHASIL!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "  ${CYAN}Cara pakai:${NC}"
echo -e "    ${GREEN}dnzcyber${NC}           - Buka menu Dnzcyber"
echo -e "    ${GREEN}dnzcyber-update${NC}    - Update ke versi terbaru"
echo ""
echo -e "${YELLOW}[i] TUTUP & BUKA ULANG Termux dulu, baru ketik: dnzcyber${NC}"
echo ""
