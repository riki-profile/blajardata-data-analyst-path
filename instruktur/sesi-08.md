# Runsheet Sesi 8 · Pembersihan Data dan Visualisasi

**Kamis, 26 November 2026 · 20.00–22.00 WIB (2 jam)** · Materi: [materi/sesi-08-cleaning-visualisasi](../materi/sesi-08-cleaning-visualisasi/)

## Persiapan

- [ ] Jalankan notebook dari awal. **Baca judul ketiga grafik** yang dihasilkan otomatis dan pastikan kalimatnya sesuai dengan grafiknya pada data hari itu. Terutama judul grafik 3 ("menyebar cukup merata").
- [ ] Siapkan satu contoh grafik "buruk" (pie dengan 20 irisan, 3D, judul "Chart 1") untuk dibandingkan dengan grafik yang baik. Bisa dibuat cepat di Google Sheets.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 7 | Nilai kosong di `users` → jembatan ke checklist |
| 20.15 | A1 checklist | 5 cek. Missing yang **bermakna**: tabel % kosong per status adalah inti bagian ini |
| 20.30 | A1 lanjutan | Duplikat, tipe data (UTC), nilai kategori, logika bisnis |
| 20.40 | A2–A4 | Kolom baru; buang bulan berjalan; **catatan pembersihan**: kebiasaan yang membedakan analis yang baik |
| 20.55 | Istirahat | 5 menit |
| 21.00 | B1 prinsip | Grafik buruk vs baik; tabel memilih bentuk grafik; "judul = kesimpulan" |
| 21.10 | B2 grafik garis | Kenapa sumbu Y mulai dari 0; anotasi titik terakhir; sumber data |
| 21.20 | B3 batang | Horizontal + diurutkan; satu warna sorotan |
| 21.28 | B4 histogram | Bin; garis median; diskusi judul |
| 21.35 | B5 simpan | `savefig` + unduh + unggah ke `images/` + cara menampilkan di README |
| 21.40 | Giliran kamu | G1–G2 |
| 21.50 | Tanya jawab | |
| 21.58 | Penutup | PR |

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

```python
# G1. Pesanan per status
per_status = orders_bersih["status"].value_counts().sort_values()
fig, ax = plt.subplots()
ax.barh(per_status.index, per_status.values, color=WARNA_UTAMA)
porsi_complete = per_status["Complete"] / per_status.sum() * 100
ax.set_title(f"{porsi_complete:.0f}% pesanan berstatus Complete")
ax.set_xlabel("Jumlah pesanan")
ax.grid(axis="y", visible=False)
plt.show()

# G2. Rata-rata lama pengiriman 12 bulan terakhir
hari_bulanan = orders_bersih.groupby("order_month")["hari_sampai"].mean().tail(12)
fig, ax = plt.subplots()
ax.plot(hari_bulanan.index, hari_bulanan.values, color=WARNA_UTAMA, linewidth=2)
ax.set_ylim(bottom=0)
ax.set_title(f"Rata-rata pengiriman {hari_bulanan.mean():.1f} hari, relatif stabil")
ax.set_ylabel("Hari")
plt.show()

# PR1a
iqr = q3 - q1
batas_bawah = q1 - 1.5 * iqr
batas_atas = q3 + 1.5 * iqr
print(q1, q3, iqr, batas_bawah, batas_atas)

# PR1b
outlier = products[(products["retail_price"] < batas_bawah) | (products["retail_price"] > batas_atas)]
print(len(outlier), "produk outlier")
outlier["category"].value_counts().head()

# PR1c
print(products[["name", "brand"]].isna().sum())
products["brand"] = products["brand"].fillna("Tidak diketahui")
```

Keputusan outlier yang diharapkan: **dibiarkan** (atau dianalisis terpisah), karena harga tinggi kemungkinan besar produk premium yang sah (misalnya mantel, jas), bukan kesalahan input. Hargai jawaban yang memberi alasan dari kategori produknya.

Judul G1 dan G2 dalam kunci ini harus disesuaikan setelah melihat grafiknya (misalnya "relatif stabil").

## Untuk recap sesi 9

- Tampilkan 2–3 grafik PR peserta. Diskusikan: apakah judulnya kesimpulan? Apakah grafiknya mendukung judul?
