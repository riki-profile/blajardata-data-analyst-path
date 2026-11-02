# Runsheet Sesi 9 · Statistik Deskriptif dan Analisis Pelanggan

**Sabtu, 28 November 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-09-analisis-pelanggan](../materi/sesi-09-analisis-pelanggan/)

## Persiapan

- [ ] Jalankan notebook dari awal. Catat: repeat-purchase rate, ukuran tiap segmen RFM, porsi pendapatan Champions. Judul grafik C4 dibuat otomatis; cek kalimatnya.
- [ ] Siapkan 1 contoh temuan yang baik dan 1 yang lemah untuk sesi tanya jawab.
- [ ] Setelah kelas: kirim **pengingat instalasi Power BI** untuk sesi 10, termasuk link [panduan Parallels](../PANDUAN_MAC_PARALLELS.md) untuk pengguna Mac (mulai Minggu, 29 November).

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 14.00 | Recap sesi 8 | 5 menit: satu grafik, satu pesan; judul = kesimpulan |
| 14.05 | Bagian A | Mean vs median; histogram miring ke kanan; analogi gaji: kalau satu miliarder masuk ruangan, rata-rata gaji naik, median tidak |
| 14.20 | Bagian B | Repeat-purchase rate; trik `.mean()` pada True/False |
| 14.30 | Bagian C | R, F, M; tanggal acuan; `qcut` dan alasan F memakai aturan tetap. Segmen = tindakan; grafik porsi pelanggan vs pendapatan; `merge` = JOIN |
| 14.50 | **Kerjakan bersama** | B1–B2, dipandu langkah demi langkah |
| 15.00 | **3 temuan + rekomendasi bersama** | Contoh temuan baik vs lemah (apa → kenapa penting → bukti). Lalu untuk setiap temuan: tunjukkan angkanya, tanya "apa artinya bagi bisnis?", tulis bersama. Urutan: repeat rate → Champions → median vs rata-rata. Tutup dengan rekomendasi |
| 15.15 | **Unggah bersama** | Repo `thelook-python-analysis` → README → tempel template Python → isi Ringkasan, 3 temuan, rekomendasi. Unggah notebook + `04_segmen_rfm.png`. **Modul Python selesai** |
| 15.30 | Tanya jawab | |
| 15.37 | Penutup | Jalankan **checklist hasil** di bawah. Jalur penuh: install Power BI sebelum sesi 10 (Mac: Parallels, mulai Minggu) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit): tampilkan daftar ini di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] B1–B2 terisi; **3 temuan + rekomendasi** tertulis di notebook (dengan angka)
- [ ] `README.md` repo `thelook-python-analysis` berisi Ringkasan, 3 temuan, rekomendasi (tidak ada `<...>` tersisa)
- [ ] `notebooks/09_customer_analysis.ipynb` dan `images/04_segmen_rfm.png` ada di repo
- [ ] Repo berisi 5 notebook (`05` sampai `09`) dan 4 gambar
- [ ] **Modul Python selesai**. Jalur penuh: tahu harus install Power BI sebelum sesi 10 (Mac: Parallels, mulai Minggu)

## Poin penting

- RFM bukan rumus baku. Aturan skor dan segmen boleh disesuaikan, asal **ditulis**.
- Pada data TheLook, sebagian besar pelanggan hanya berbelanja sekali, sehingga repeat rate rendah. Ini temuan bisnis yang kuat untuk README.
- Temuan yang lemah: "Pendapatan Jeans 1,2 juta USD." Temuan yang baik: "Jeans dan Outerwear menyumbang X% pendapatan; ketergantungan pada dua kategori ini berisiko kalau tren musim berubah."

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/09_customer_analysis.ipynb`](kunci-jawaban/09_customer_analysis.ipynb). Ringkasannya:

```python
# B1. Repeat rate per negara (5 negara terbesar)
pp = pesanan.groupby("user_id").agg(jumlah_pesanan=("order_id", "nunique"),
                                    country=("country", "first"))
pp["berulang"] = pp["jumlah_pesanan"] >= 2
top5 = pp["country"].value_counts().head(5).index
(pp[pp["country"].isin(top5)].groupby("country")["berulang"].mean() * 100).round(1).sort_values(ascending=False)

# B2. Median monetary Champions vs Pelanggan Baru
median_m = rfm.groupby("segmen")["monetary"].median()
print(median_m)
print(f"{median_m['Champions'] / median_m['Pelanggan Baru']:.1f} kali lipat")
```

**Tiga temuan bersama (contoh)**, sesuaikan angkanya dengan data hari itu:

> **Hanya sebagian kecil pelanggan yang kembali berbelanja.** Repeat-purchase rate X%: sebagian besar pelanggan berbelanja sekali lalu tidak kembali. Pertumbuhan pendapatan bergantung pada akuisisi pelanggan baru yang biayanya lebih mahal. *(Bukti: notebook 09, Bagian B.)*

## Untuk recap sesi 10

- Pilih 2 README `thelook-python-analysis` terbaik untuk ditunjukkan sebentar (peserta modul Python sudah selesai; yang hadir di sesi 10 adalah jalur penuh dan peserta baru modul Power BI).
