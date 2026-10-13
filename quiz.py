#!/usr/bin/env python3
import random, os, sys

POOL = [
    ("Apa kepanjangan SQL?", ["Structured Query Language","System Quality Layer","Secure Query Logic","Server Queue Line"], "a"),
    ("Port default SSH?", ["21","22","80","443"], "b"),
    ("Tool untuk scan port?", ["Photoshop","Nmap","Excel","Chrome"], "b"),
    ("Port default HTTPS?", ["21","22","80","443"], "d"),
    ("Kepanjangan OSINT?", ["Open Source Intelligence","Operating System Internal","Online Security Internet","Office System Interface"], "a"),
    ("Phishing adalah?", ["Memancing ikan","Penipuan via link palsu","Nama tool","Bahasa program"], "b"),
    ("White Hat Hacker?", ["Jahat","Topi putih","Etis/legal","Amatir"], "c"),
    ("Fungsi Firewall?", ["Percepat internet","Saring traffic jaringan","Hapus virus","Bikin password"], "b"),
    ("Enkripsi password terbaik?", ["MD5","SHA-1","bcrypt/argon2","Plain text"], "c"),
    ("UU cyber crime Indonesia?", ["UU ITE","UU Lalin","UU Naker","UU Pajak"], "a"),
    ("Port default HTTP?", ["80","443","22","21"], "a"),
    ("Port default FTP?", ["21","22","80","443"], "a"),
    ("Apa itu DDoS?", ["Serangan banjir traffic","Nama virus","Aplikasi","Email spam"], "a"),
    ("Kepanjangan VPN?", ["Virtual Private Network","Very Personal Net","Virtual Public Node","Verified Private Node"], "a"),
    ("Tool sniffing paket?", ["Wireshark","Photoshop","Notepad","Excel"], "a"),
    ("Apa itu brute force?", ["Coba semua kombinasi","Tebak feeling","Hack pakai AI","Scan jaringan"], "a"),
    ("Port default DNS?", ["53","80","443","22"], "a"),
    ("Metode hack via SQL?", ["SQL Injection","XSS","Phishing","DDoS"], "a"),
    ("XSS singkatan?", ["Cross Site Scripting","Extra Small System","X Server System","Xtreme Safe"], "a"),
    ("Apa itu ransomware?", ["Malware minta tebusan","Game online","Browser","Anti virus"], "a"),
    ("Tool password crack?", ["Hydra","Photoshop","Chrome","Nmap"], "a"),
    ("Apa itu Metasploit?", ["Framework exploit","Game","Browser","OS"], "a"),
    ("Bash adalah?", ["Shell Linux","Bahasa Jepang","Nama tool","Hardware"], "a"),
    ("Apa itu Kernel?", ["Inti sistem operasi","Nama virus","Aplikasi","Browser"], "a"),
    ("Port default Telnet?", ["23","22","80","443"], "a"),
    ("Packet analyzer?", ["Wireshark","Nmap","John","Hydra"], "a"),
    ("Apa itu Zero-day?", ["Bug belum ada patch","Bug lama","Nama virus","Tools"], "a"),
    ("Kepanjangan IoT?", ["Internet of Things","Input of Tech","Internet of Tools","Interface of Things"], "a"),
    ("Apa itu Botnet?", ["Jaringan komputer terinfeksi","Nama robot","Chat app","Game"], "a"),
    ("Tool OSINT username?", ["Sherlock","Nmap","Hydra","SQLMap"], "a"),
    ("Apa itu Tor?", ["Anonim browser","Nama virus","Tools hacking","Email"], "a"),
    ("Kepanjangan APT?", ["Advanced Persistent Threat","Anti Phishing Tool","Advance Protection","App Personal Tracker"], "a"),
    ("Apa itu Honey Pot?", ["Jebakan hacker","Madu","Nama tool","Bahasa program"], "a"),
    ("Enkripsi simetris?", ["1 kunci sama","2 kunci beda","Tanpa kunci","Manual"], "a"),
    ("Enkripsi asimetris?", ["Public & Private key","1 kunci","Password","PIN"], "a"),
    ("Apa itu MAC Address?", ["ID unik hardware jaringan","Alamat rumah","IP publik","Nama WiFi"], "a"),
    ("Kepanjangan SSH?", ["Secure Shell","System Socket Host","Safe Server Hub","Simple Shell"], "a"),
    ("Kepanjangan TCP?", ["Transmission Control Protocol","Transfer Control Program","Total Connection Point","Technical Computer Port"], "a"),
    ("Apa itu Exploit?", ["Kode manfaatkan bug","Game","Aplikasi","Bahasa program"], "a"),
]

random.shuffle(POOL)
soal = POOL[:10]
skor = 0

for i, (q, opts, jawab) in enumerate(soal, 1):
    os.system("clear")
    print("\033[1;36m=== QUIZ HACKER ===\033[0m")
    print(f"\033[1;33mSoal {i}/10 | Skor: {skor}\033[0m")
    print()
    print(f"\033[1;32m{q}\033[0m")
    print()
    labels = ["a","b","c","d"]
    for j, opt in enumerate(opts):
        print(f"  {labels[j]}) {opt}")
    print()
    ans = input("Jawaban (a/b/c/d, 0=keluar): ").strip().lower()
    if ans == "0":
        sys.exit(0)
    if ans == jawab:
        skor += 1
        print("\033[1;32mBENAR!\033[0m")
    else:
        print(f"\033[1;31mSALAH! Jawaban: {jawab}\033[0m")
    input("Enter...")

os.system("clear")
print("\033[1;36m========================================\033[0m")
print(f"\033[1;32m       SKOR AKHIR: {skor} / 10\033[0m")
print("\033[1;36m========================================\033[0m")
if skor == 10: print("\033[1;32mPERFECT! Lu calon hacker pro!\033[0m")
elif skor >= 8: print("\033[1;32mHEBAT! Skill lu udah jago!\033[0m")
elif skor >= 5: print("\033[1;33mLUMAYAN! Terus belajar!\033[0m")
else: print("\033[1;31mBELAJAR LAGI bro!\033[0m")
input("\nEnter untuk kembali...")
