
# 🛡️ Dnzcyber Linux v15.1

![Version](https://img.shields.io/badge/version-15.1-green)
![Platform](https://img.shields.io/badge/platform-Termux-blue)
![License](https://img.shields.io/badge/license-MIT-orange)

> **Silent. Stealth. Secure.**
> Toolkit hacking & OSINT lengkap untuk Termux. 21 menu tools siap pakai tanpa perlu ketik command manual.

---

## 📋 Fitur (21 Menu)

| Menu | Nama | Deskripsi |
|------|------|-----------|
| 01 | Setup & Install | Install semua tools otomatis |
| 02 | Nmap Workspace | Port scanner (5 mode) |
| 03 | SQLMap Workspace | SQL injection scanner |
| 04 | Wafw00f Workspace | Web application firewall detector |
| 05 | Whois Lookup | Info domain |
| 06 | DNS Lookup | Cek record A/MX/NS/TXT |
| 07 | Reverse DNS / Ping | Network tools |
| 08 | HTTP Headers | Analisis header website |
| 09 | Netcat | Port checker |
| 10 | Gobuster | Directory scanner |
| 11 | Lacak IP | Multi-API IP geolocation (6 API) |
| 12 | Info Nomor HP/WA | OSINT nomor telepon |
| 13 | OTP WhatsApp | OTP tool (testing only) |
| 14 | Custom Command | Jalanin command apapun |
| 15 | Update Dnzcyber | Update otomatis dari GitHub |
| 16 | Game Zone | Snake, Quiz, TTT, dll |
| 17 | Debian Proot | Debian Linux container |
| 18 | Cek IP Sendiri | Cek IP publik sendiri (IPv4) |
| 19 | OP Tools | Recon & OSINT (8 sub-tools) |
| 20 | Animasi Full Screen | Parrot, Nyan Cat, dll |
| 21 | Keluar | Exit |

### 🆕 Yang Baru di v15.1

- **OP Tools** — Subdomain finder, email breach check, username hunter, SSL checker, wayback machine, hash identifier, password generator, port scanner
- **IP Tracker Multi-API** — Cross-check 6 API sekaligus untuk akurasi maksimal
- **IPv4 Force** — Paksa IPv4 untuk hasil geolocation lebih akurat
- **Debian Proot** — Linux container untuk install tools Kali

---

## 📱 Cara Install (Untuk Pemula)

### 1. Install Termux

**⚠️ PENTING:** Download Termux **hanya** dari **F-Droid**, bukan dari Play Store.

- **F-Droid:** https://f-droid.org/packages/com.termux/

### 2. Buka Termux & Paste Command Ini

```bash
pkg install git -y && git clone https://github.com/DanzXditz/Dnzcyber-Linux.git && cd Dnzcyber-Linux && bash install.sh
