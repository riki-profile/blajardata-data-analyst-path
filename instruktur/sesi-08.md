# Runsheet Sesi 8 · Pembersihan Data dan Visualisasi

**Kamis, 26 November 2026 · 20.00–22.00 WIB (2 jam)** · Materi: [materi/sesi-08-cleaning-visualisasi](../materi/sesi-08-cleaning-visualisasi/)

## Persiapan

- [ ] Jalankan notebook dari awal. **Baca judul ketiga grafik** yang dihasilkan otomatis dan pastikan kalimatnya sesuai dengan grafiknya pada data hari itu. Terutama judul grafik 3 ("menyebar cukup merata").
- [ ] Siapkan satu contoh grafik "buruk" (pie dengan 20 irisan, 3D, judul "Chart 1") untuk dibandingkan dengan grafik yang baik. Bisa dibuat cepat di Google Sheets.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap sesi 7 | 5 menit: 5 perintah pertama; `isna().sum()` → jembatan ke checklist |
| 20.05 | A1 checklist | 5 cek. Missing yang **bermakna**: tabel % kosong per status adalah inti bagian ini |
| 20.18 | A1 lanjutan | Duplikat, tipe data (UTC), nilai kategori, logika bisnis |
| 20.30 | A2–A4 | Kolom baru; buang bulan berjalan; **catatan pembersihan**: kebiasaan yang membedakan analis yang baik |
| 20.45 | Istirahat | 5 menit |
| 20.50 | B1 prinsip | Grafik buruk vs baik; tabel memilih bentuk grafik; "judul = kesimpulan" |
| 21.00 | B2 grafik garis | Kenapa sumbu Y mulai dari 0; anotasi titik terakhir; sumber data |
| 21.10 | B3 batang | Horizontal + diurutkan; satu warna sorotan |
| 21.18 | B4 histogram | Bin; garis median; diskusi judul |
| 21.25 | B5 simpan | `savefig` + unduh gambar |
| 21.30 | **Kerjakan bersama** | B1–B2, dipandu langkah demi langkah |
| 21.40 | **Unggah bersama** | Notebook ke `notebooks/`, 3 gambar ke `images/` (buat foldernya dengan `images/README.md`) |
| 21.50 | Tanya jawab | |
| 21.57 | Penutup | Jalankan **checklist hasil** di bawah. Ringkasan; latihan mandiri L1–L2 (opsional) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit). Daftar yang sama ada di README sesi peserta (bagian *Checklist hasil*), jadi kamu bisa langsung menampilkan halaman README itu di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] Bagian A (pembersihan) dan B (3 grafik) sudah dijalankan; B1–B2 terisi
- [ ] `notebooks/08_cleaning_and_charts.ipynb` ada di repo
- [ ] Folder `images/` berisi `01_pendapatan_bulanan.png`, `02_porsi_kategori.png`, `03_sebaran_umur.png`
- [ ] Gambar terbuka saat diklik di GitHub (bukan file 0 KB)

## Poin penting

- **Jangan isi data kosong yang bermakna.** Mengisi `shipped_at` kosong dengan tanggal lain menciptakan data palsu.
- **Judul otomatis adalah alat bantu, bukan pengganti berpikir.** Tekankan saat B4.
- Gaya grafik (`rcParams`) diatur sekali di atas; peserta cukup menyalin blok itu ke notebook berikutnya.
- Satu warna utama (biru) + satu warna sorotan (oranye). Hindari pelangi.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `TypeError: Cannot compare tz-naive and tz-aware` | Sel konversi zona waktu (A1.3) belum dijalankan sebelum A1.5 |
| Grafik kosong / tidak muncul | `plt.show()` dipanggil sebelum `savefig`, atau sel dijalankan dua kali |
| Gambar tidak ada di `images/` | Runtime Colab sempat terputus; jalankan ulang |
| `files.download` tidak mengunduh | Browser memblokir unduhan ganda; izinkan pop-up/unduhan dari Colab |

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/08_cleaning_and_charts.ipynb`](kunci-jawaban/08_cleaning_and_charts.ipynb). Ringkasannya:

```python
# B1. Pesanan per status
per_status = orders_bersih["status"].value_counts().sort_values()
fig, ax = plt.subplots()
ax.barh(per_status.index, per_status.values, color=WARNA_UTAMA)
porsi_complete = per_status["Complete"] / per_status.sum() * 100
ax.set_title(f"{porsi_complete:.0f}% pesanan berstatus Complete")
ax.set_xlabel("Jumlah pesanan")
ax.grid(axis="y", visible=False)
plt.show()

# B2. Rata-rata lama pengiriman 12 bulan terakhir
hari_bulanan = orders_bersih.groupby("order_month")["hari_sampai"].mean().tail(12)
fig, ax = plt.subplots()
ax.plot(hari_bulanan.index, hari_bulanan.values, color=WARNA_UTAMA, linewidth=2)
ax.set_ylim(bottom=0)
ax.set_title(f"Rata-rata pengiriman {hari_bulanan.mean():.1f} hari, relatif stabil")
ax.set_ylabel("Hari")
plt.show()

# L1a
iqr = q3 - q1
batas_bawah = q1 - 1.5 * iqr
batas_atas = q3 + 1.5 * iqr
print(q1, q3, iqr, batas_bawah, batas_atas)

# L1b
outlier = products[(products["retail_price"] < batas_bawah) | (products["retail_price"] > batas_atas)]
print(len(outlier), "produk outlier")
outlier["category"].value_counts().head()

# L1c
print(products[["name", "brand"]].isna().sum())
products["brand"] = products["brand"].fillna("Tidak diketahui")
```

Keputusan outlier yang diharapkan: **dibiarkan** (atau dianalisis terpisah), karena harga tinggi kemungkinan besar produk premium yang sah (misalnya mantel, jas), bukan kesalahan input. Hargai jawaban yang memberi alasan dari kategori produknya.

Judul B1 dan B2 dalam kunci ini harus disesuaikan setelah melihat grafiknya (misalnya "relatif stabil").

## Untuk recap sesi 9 (5 menit)

- Tampilkan 1 grafik dari sesi 8 dan tanyakan: apakah judulnya kesimpulan? Apakah grafiknya mendukung judul?
