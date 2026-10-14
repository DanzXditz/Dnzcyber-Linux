#!/usr/bin/env python3
# Dnzcyber - Multi-API IP Tracker v3 (Force IPv4)
import sys, json, urllib.request
from collections import Counter

def fetch(url, timeout=8):
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return json.loads(r.read().decode())
    except:
        return None

def track(ip):
    print("\033[1;36m========================================\033[0m")
    print(f"\033[1;32m     MELACAK IP: {ip}\033[0m")
    print("\033[1;36m========================================\033[0m")
    print("\033[1;33m[*] Cross-check 6 API...\033[0m")
    print()

    results = []

    d = fetch(f"http://ip-api.com/json/{ip}?fields=status,country,regionName,city,zip,lat,lon,timezone,isp,org,as")
    if d and d.get('status') == 'success':
        results.append({'src':'ip-api.com','country':d.get('country','-'),'region':d.get('regionName','-'),
            'city':d.get('city','-'),'zip':d.get('zip','-'),'lat':d.get('lat'),'lon':d.get('lon'),
            'isp':d.get('isp','-'),'org':d.get('org','-')})
        print(f"  \033[1;32m[1/6] OK\033[0m ip-api.com")
    else: print(f"  \033[1;31m[1/6] XX\033[0m ip-api.com")

    d = fetch(f"http://ipwhois.app/json/{ip}")
    if d and d.get('success'):
        results.append({'src':'ipwhois.app','country':d.get('country','-'),'region':d.get('region','-'),
            'city':d.get('city','-'),'zip':'-','lat':d.get('latitude'),'lon':d.get('longitude'),
            'isp':d.get('isp','-'),'org':d.get('org','-')})
        print(f"  \033[1;32m[2/6] OK\033[0m ipwhois.app")
    else: print(f"  \033[1;31m[2/6] XX\033[0m ipwhois.app")

    d = fetch(f"https://ipinfo.io/{ip}/json")
    if d and 'city' in d:
        loc = d.get('loc','').split(',')
        results.append({'src':'ipinfo.io','country':d.get('country','-'),'region':d.get('region','-'),
            'city':d.get('city','-'),'zip':d.get('postal','-'),
            'lat':float(loc[0]) if len(loc)>0 and loc[0] else None,
            'lon':float(loc[1]) if len(loc)>1 and loc[1] else None,
            'isp':d.get('org','-'),'org':d.get('org','-')})
        print(f"  \033[1;32m[3/6] OK\033[0m ipinfo.io")
    else: print(f"  \033[1;31m[3/6] XX\033[0m ipinfo.io")

    d = fetch(f"https://ipapi.co/{ip}/json/")
    if d and d.get('city'):
        results.append({'src':'ipapi.co','country':d.get('country_name','-'),'region':d.get('region','-'),
            'city':d.get('city','-'),'zip':d.get('postal','-'),'lat':d.get('latitude'),'lon':d.get('longitude'),
            'isp':d.get('org','-'),'org':d.get('org','-')})
        print(f"  \033[1;32m[4/6] OK\033[0m ipapi.co")
    else: print(f"  \033[1;31m[4/6] XX\033[0m ipapi.co")

    d = fetch(f"https://freeipapi.com/api/json/{ip}")
    if d and d.get('cityName'):
        results.append({'src':'freeipapi.com','country':d.get('countryName','-'),'region':d.get('regionName','-'),
            'city':d.get('cityName','-'),'zip':d.get('zipCode','-'),
            'lat':d.get('latitude'),'lon':d.get('longitude'),'isp':'-','org':'-'})
        print(f"  \033[1;32m[5/6] OK\033[0m freeipapi.com")
    else: print(f"  \033[1;31m[5/6] XX\033[0m freeipapi.com")

    d = fetch(f"https://ipwho.is/{ip}")
    if d and d.get('success'):
        conn = d.get('connection', {}) if isinstance(d.get('connection'),dict) else {}
        results.append({'src':'ipwho.is','country':d.get('country','-'),'region':d.get('region','-'),
            'city':d.get('city','-'),'zip':d.get('postal','-'),'lat':d.get('latitude'),'lon':d.get('longitude'),
            'isp':conn.get('isp','-'),'org':conn.get('org','-')})
        print(f"  \033[1;32m[6/6] OK\033[0m ipwho.is")
    else: print(f"  \033[1;31m[6/6] XX\033[0m ipwho.is")

    print()
    if not results:
        print("\033[1;31m[!] Semua API gagal. Cek koneksi.\033[0m"); return

    print("\033[1;36m========================================\033[0m")
    print("\033[1;32m     HASIL KONSENSUS\033[0m")
    print("\033[1;36m========================================\033[0m")
    print()

    cities = [r['city'] for r in results if r['city'] and r['city'] != '-']
    regions = [r['region'] for r in results if r['region'] and r['region'] != '-']

    if cities:
        top_city, count = Counter(cities).most_common(1)[0]
        conf = int((count / len(results)) * 100)
        bar = '#' * (conf // 10) + '-' * (10 - conf // 10)
        color = '\033[1;32m' if conf >= 60 else '\033[1;33m' if conf >= 40 else '\033[1;31m'
        print(f"\033[1;33m  Kota Konsensus  :\033[0m {color}{top_city}\033[0m")
        print(f"\033[1;33m  Kepercayaan     :\033[0m {color}[{bar}] {conf}%\033[0m")
        print(f"\033[1;33m  Dukungan        :\033[0m {count}/{len(results)} API")
        print()

    if regions:
        top_reg, count = Counter(regions).most_common(1)[0]
        print(f"\033[1;33m  Region Konsensus:\033[0m {top_reg} ({count}/{len(results)} API)")
        print()

    countries = [r['country'] for r in results if r['country'] and r['country'] != '-']
    if countries:
        top_c, count = Counter(countries).most_common(1)[0]
        print(f"\033[1;33m  Negara Konsensus:\033[0m {top_c} ({count}/{len(results)} API)")
        print()

    lats = [r['lat'] for r in results if r['lat']]
    lons = [r['lon'] for r in results if r['lon']]
    if lats and lons:
        avg_lat = sum(lats) / len(lats)
        avg_lon = sum(lons) / len(lons)
        print(f"\033[1;33m  Rata-rata Koord :\033[0m {avg_lat:.4f}, {avg_lon:.4f}")
        print()
        print(f"\033[1;36m  MAPS: https://www.google.com/maps?q={avg_lat},{avg_lon}\033[0m")
        print()

    print("\033[1;36m========================================\033[0m")
    print("\033[1;32m     DETAIL PER API\033[0m")
    print("\033[1;36m========================================\033[0m")
    print()
    for i, r in enumerate(results, 1):
        print(f"\033[1;35m  [{i}] {r['src']}\033[0m")
        print(f"      Negara   : {r['country']}")
        print(f"      Region   : {r['region']}")
        print(f"      Kota     : \033[1;32m{r['city']}\033[0m")
        print(f"      Kode Pos : {r['zip']}")
        print(f"      ISP      : {r['isp']}")
        if r['lat'] and r['lon']:
            print(f"      Koord    : {r['lat']}, {r['lon']}")
        print()

    print("\033[1;33m[!] CATATAN:\033[0m")
    print("  - Seluler (XL/Tsel): CGNAT, akurasi 100-200km")
    print("  - Rumahan (Indihome): Akurasi sampai kecamatan")
    print("  - Akurasi tertinggi: tingkat KOTA")
    print("  - Alamat rumah: butuh surat izin polisi")
    print("  - IPv6 kurang akurat, IPv4 lebih baik")
    print()

if __name__ == "__main__":
    ip = sys.argv[1] if len(sys.argv) > 1 else input("Masukkan IP: ").strip()
    if ip: track(ip)
    else: print("IP kosong!")
