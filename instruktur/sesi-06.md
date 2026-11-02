# Runsheet Sesi 6 · Dasar Python II

**Sabtu, 21 November 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-06-python-dasar-2](../materi/sesi-06-python-dasar-2/)

## Persiapan

- [ ] Notebook kosong untuk mengetik ulang, notebook lengkap sebagai cadangan.
- [ ] Ingatkan di grup setelah kelas: **siapkan Project ID BigQuery** untuk sesi 7.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 14.00 | Recap sesi 5 | 5 menit: list, dictionary; "bagaimana kalau negaranya 15?" → jembatan ke loop |
| 14.05 | Demo 1–2 | `==` vs `=`; if/elif/else; **indentasi**. Hubungkan dengan CASE WHEN |
| 14.20 | Demo 3 | Loop for; akumulator (gambarkan tabel nilai `total` di setiap putaran); menghitung per kelompok = GROUP BY |
| 14.35 | Demo 4 | Function: definisi vs pemanggilan; parameter; return vs print; default |
| 14.45 | Demo 5 | Studi kasus label ukuran pesanan. **Uji nilai batas** (50, 150), kebiasaan penting seorang analis |
| 14.55 | **Kerjakan bersama** | B1–B2, dipandu langkah demi langkah |
| 15.10 | **Unggah bersama** | `06_functions.ipynb` ke `notebooks/` repo `thelook-python-analysis` |
| 15.20 | Tanya jawab | Bahas bagian 6 (cara membaca error) jika belum |
| 15.37 | Penutup | Jalankan **checklist hasil** di bawah. Ringkasan; latihan mandiri bagian 8 (opsional). **Siapkan Project ID untuk sesi 7** |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit): tampilkan daftar ini di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] B1–B2 terisi dan sel sudah dijalankan
- [ ] `notebooks/06_functions.ipynb` ada di repo `thelook-python-analysis`
- [ ] **Project ID** BigQuery sudah dicatat untuk sesi 7

## Poin penting

- **Indentasi** adalah sumber error nomor satu. Tunjukkan perbedaan hasil kalau `print` berada di dalam vs di luar loop.
- **print vs return.** Demonstrasikan: `x = function_yang_print()` → `x` berisi `None`.
- Nilai batas: `>=` vs `>` mengubah label untuk 50 dan 150 tepat.

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/06_functions.ipynb`](kunci-jawaban/06_functions.ipynb). Ringkasannya:

```python
# B1
def perlu_follow_up(status):
    """True jika pesanan masih dalam proses atau pengiriman."""
    return status in ["Processing", "Shipped"]

print(perlu_follow_up("Processing"), perlu_follow_up("Shipped"), perlu_follow_up("Complete"))

# B2
total_batal = 0
for pesanan in daftar_pesanan:
    if pesanan["status"] == "Cancelled":
        total_batal += pesanan["total"]
print(total_batal)

# L1
def kelompok_umur(umur):
    """Label kelompok umur, sama dengan CASE WHEN di sesi 4."""
    if umur < 18:
        return "1. Di bawah 18"
    elif umur < 25:
        return "2. 18-24"
    elif umur < 35:
        return "3. 25-34"
    elif umur < 45:
        return "4. 35-44"
    elif umur < 55:
        return "5. 45-54"
    else:
        return "6. 55+"

for u in [15, 18, 24, 25, 54, 70]:
    print(u, kelompok_umur(u))

# L2
def persen_margin(harga_jual, biaya):
    """Persentase margin, 1 desimal. Mengembalikan 0 jika harga_jual 0."""
    if harga_jual == 0:
        return 0
    return round((harga_jual - biaya) / harga_jual * 100, 1)

print(persen_margin(60, 27), persen_margin(0, 10))

# L3
pendapatan_per_negara = {}
for pesanan in daftar_pesanan:
    if pesanan["status"] in ["Cancelled", "Returned"]:
        continue   # lewati pesanan yang tidak sah
    negara = pesanan["country"]
    pendapatan_per_negara[negara] = pendapatan_per_negara.get(negara, 0) + pesanan["total"]
print(pendapatan_per_negara)
print(max(pendapatan_per_negara, key=pendapatan_per_negara.get))

# L4
def label_ukuran_pesanan_v2(total, batas_sedang=50, batas_besar=150):
    """Label ukuran pesanan dengan batas yang bisa diatur."""
    if total >= batas_besar:
        return "besar"
    elif total >= batas_sedang:
        return "sedang"
    else:
        return "kecil"

jumlah = {"kecil": 0, "sedang": 0, "besar": 0}
for pesanan in daftar_pesanan:
    jumlah[label_ukuran_pesanan_v2(pesanan["total"], 75, 200)] += 1
print(jumlah)
```

L3 memakai `continue` dan `.get(key, 0)`, yang tidak diajarkan eksplisit. Jawaban dengan `if/else` seperti di demo "menghitung per kelompok" juga benar.

L4, contoh jawaban kalimat: "Tim marketing bisa mencoba batas ongkir gratis yang berbeda tanpa mengubah kode function."

## Untuk recap sesi 7

- Tunjukkan bahwa `kelompok_umur()` dan `CASE WHEN` sesi 4 memberi hasil yang sama: logika yang sama, dua bahasa.
